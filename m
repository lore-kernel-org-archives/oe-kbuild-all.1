Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3647D100C9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 16:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7036DC433C7;
	Mon,  3 Jul 2023 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1688401905;
	bh=ta27/WrMgddr0A0XUPYklak31CmwlF/MOqNMNN535l8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S7iiL9yN8F6OXao83B8E6z0JJ9ehgQO9V+IDIb31U0NZCYLtH+g/SEo/4t5knczHa
	 5CvyH+HMYN8cOcz6YfIrvK3zOHu/Dfy32w3Cyw1JdWjSs1D8z6Agw7N4dAArmeTd82
	 c2FKVG1Vnt5n41vsrZONLNr6GeZHCfnDNChKNsoo=
Date: Mon, 3 Jul 2023 09:31:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Baoquan He <bhe@redhat.com>
Subject: Re: [akpm-mm:mm-unstable 62/89] include/linux/kexec.h:41:2: error:
 #error KEXEC_SOURCE_MEMORY_LIMIT not defined
Message-Id: <20230703093144.27aa0d991c380f54be34ae93@linux-foundation.org>
In-Reply-To: <3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle.com>
References: <202307031404.Mjmo2JK6-lkp@intel.com>
	<3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Jul 2023 10:31:34 -0500 Eric DeVolder <eric.devolder@oracle.com> wrote:

> Here are three possible courses of action:
>   - do nothing; preserve existing behavior as intended by the series (even though problems like this 
> can occur)
>   - fix it with CRASH_DUMP selecting KEXEC to eliminate the problem

This one, please.

Or make CRASH_DUMP depend on KEXEC.

>   - do not fix it but document the reason why this problem occurs in the commit message
