Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB6656
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 01:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="R29QRSd2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mpCBnjQo/44mFVnof1U7TK+Dw27YW8ACazu4SL9I5tA=; b=R29QRSd2ztGgULsgRR4ck/TPBC
	O3eSwfOeZbleMS8FuJdmbXLdBp/SynaU3Z5pXV8frttoNMM9i3YbjQ78yZgd5l2RzKt8VYL9vFkPc
	XOStuvi5hESY3WV5cK3w+g5JLUgOKJl6ylHMEgJSljFv2ydAXH9DTO+92OYkz6soAwDTqtgpPg5tu
	lZd1Ii+PWYZfZolsteukDnv9wGDBOPtrnU9w8pqhTEZGuQ50g0LxOe/Qh0Rsc1Hkt9lquAz4bRwSe
	C3mEnFbfiw/43nxG+JLiP2Keh0NaLnG7YI4xCAuIgxuSHkDe7efe9fjsBzNA0TCBw43ia8ST75mHe
	xerzTMwA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rDb0j-00ByRT-1X;
	Thu, 14 Dec 2023 01:59:37 +0000
Date: Thu, 14 Dec 2023 01:59:37 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [viro-vfs:headers.unaligned 2/2]
 include/linux/unaligned.h:119:16: sparse: sparse: cast truncates bits from
 constant value (aa01a0 becomes a0)
Message-ID: <20231214015937.GO1674809@ZenIV>
References: <202312140955.cqLj4SLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312140955.cqLj4SLn-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Dec 14, 2023 at 09:25:30AM +0800, kernel test robot wrote:
> Hi Al,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

It is, unless the mainline does *not* have equivalent warnings refering
include/asm-generic/unaligned.h instead of include/linux/unaligned.h
