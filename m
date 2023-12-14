Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045702C18D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="LRFGOXCe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CIaYFv+/pS0r5+q/6X3q7uuU1S6yT0o0nzV2Kv1T8Gk=; b=LRFGOXCetvVlsjBAB/D+7vKIQ+
	FcMt4ayDZpn7ww4+ag1F910AD4PAZeWszykS7fStrbGLxmcaqeN4naDLUA4+wt0EtJhEsSfCI0ell
	2z7M2z1jxyeU0wRzk8CX+E/e+nSYoQtTQ6mx+moYDASKpHemY75wlPgZIWqK6/t9voTcbTtNy7VIW
	iJFbyZnxP9uzY2u6uz+JFI+OlP6wahdc0aP5A5Q0LOrS2EarABun6udXaj/w3EPpPXmefyYsteyl1
	J7gtLLm1e6ReMxz3MIay/40Js4IMYQagG50pJw0QsxVtj4KjI2UppmXs9M+mLoR0eHUUg4bcp9W10
	s/iQNzLg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rDhnO-00C7wj-29;
	Thu, 14 Dec 2023 09:14:18 +0000
Date: Thu, 14 Dec 2023 09:14:18 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [viro-vfs:headers.unaligned 2/2] drivers/cxl/core/trace.h:11:10:
 fatal error: asm-generic/unaligned.h: No such file or directory
Message-ID: <20231214091418.GP1674809@ZenIV>
References: <202312141458.agmsUCZB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312141458.agmsUCZB-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Dec 14, 2023 at 02:50:07PM +0800, kernel test robot wrote:
> Hi Al,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git headers.unaligned
> head:   959598f725aa7721a4bad53c2e997c7255ff32dc
> commit: 959598f725aa7721a4bad53c2e997c7255ff32dc [2/2] move asm/unaligned.h to linux/unaligned.h
> config: i386-buildonly-randconfig-002-20231214 (https://download.01.org/0day-ci/archive/20231214/202312141458.agmsUCZB-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141458.agmsUCZB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312141458.agmsUCZB-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/cxl/core/pci.c:13:
> >> drivers/cxl/core/trace.h:11:10: fatal error: asm-generic/unaligned.h: No such file or directory
>       11 | #include <asm-generic/unaligned.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~

Charming...   Anything of that sort deserves to be hunted
down and shot - including gems like this:

net/sunrpc/xprtrdma/verbs.c:58:#include <asm-generic/barrier.h>

OK, I'll adjust the script, but IMO we should make it a matter of policy -
*NOTHING* outside of arch/ and include/ should ever have
#include <asm-generic/whatever.h>

#include <asm/something.h> is generally best avoided, but it is
defendable; asm-generic is not.
