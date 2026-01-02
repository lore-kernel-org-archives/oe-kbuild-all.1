Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514B217F53;
	Fri,  2 Jan 2026 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767346213; cv=none; b=HTN69KU1nS7v7iaXQikJHI8SCi0lL8oKHtDX8kxHi5qKP4wZalYSYGsG9kSchB/Vjz8cPZ3VS7MJfivKQ5fzt3tEzASylFbREA1iRt9gRROkA950eGuZc6jyCEUBhfh9d3e2xsYysv/kyNoI2M+PxXGpqnjZDiga5liNMOzEWF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767346213; c=relaxed/simple;
	bh=SfBFiWsxbRixiqxEKsef4HE+1jMj1+baLX8MvAai0XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQegU2iZbGgMxJDm+iEDEUAFYieA2DmdTq3Yxv3JfqS1eLym2j+YZwQvLZKd7vEM1wXhgSYxYemPfZg14XU8QbhTJ1bcinfLFeieU7gVVzJmb9OectfeM5O8vtyUwcrSa0MNDyJmsyjfztbOn82xEtCxEemJLCX/mPRgZtf1X6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=M4+gxtyL; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="M4+gxtyL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xwE3ZrpIofWNR5wqpQ+3mxBYC6qpczlI+R8UPmZhaqY=; b=M4+gxtyL1HFBmJCXNr3ICWXd+x
	AwTeuYl8XqX7GpQY3BEYD1BliZOYU61VEanA/r4W0JU2KTQfY2IpGTzyLKZosp1uwYGwEuG7ojpHg
	o/9ww/0K6wVv3lLpeokZlCWF6PoGt0Va7hjzVLF3gX3G/SYocmiWBOW+LTFsyahtHZUt7ei90fl0H
	wBuefpIeAcaxKWvm7FmLbpJ+ByA0V4CwA4nPxx6EKIzc/GfNU6CZeAt02r3f2Xt6Z0Y2mRSw2gvbN
	JmhiMqxwynVGSvSJHHYzZU/KdP7SucylXJOexw9QJRkYwdvU6jX6eGyR5ISaA5c8pUjqhwTkaDFaV
	ywZDpUlw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vbbV4-00000005GRq-3NOs;
	Fri, 02 Jan 2026 09:31:14 +0000
Date: Fri, 2 Jan 2026 09:31:14 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>, Jan Kara <jack@suse.cz>
Subject: Re: fs/file_attr.c:263:9: error: unexpected token, expected comma
Message-ID: <20260102093114.GG1712166@ZenIV>
References: <202601010950.QjCTROwO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601010950.QjCTROwO-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Jan 01, 2026 at 09:41:43AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9528d5c091c59b408a754a1823cf0942069867cc
> commit: 2f952c9e8fe13c6ee15c05189f1f87c1a70b866c fs: split fileattr related helpers into separate file
> date:   6 months ago
> config: mips-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010950.QjCTROwO-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010950.QjCTROwO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601010950.QjCTROwO-lkp@intel.com/

It has nothing whatsoever to do with the commit in question; I would be
very surprised if the same build was not full of identical errors all
over the place, wherever we happen to use put_user() or get_user().

Basically, you've stumbled across a mips config that breaks something
in their asm/uaccess.h; apparently 32bit with EVA, bringing the macro
horrors from asm-eva.h into play.
