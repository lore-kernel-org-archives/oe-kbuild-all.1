Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493827B349;
	Fri,  2 Jan 2026 03:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767325018; cv=none; b=Yo/PQ+gVxAW41jkEk0/bU7mtSVsq/Lnd8ig3XQRXAX5GlmhWkSqmaoJZ96vh7AZvXFGh1Nqa3DMU+/JkzQpRgo7zlVhBwHB8XA76Nswr5H3s72WdHByn47Pu2KjQm3rJu5DDH7UxeSfdJix70EWT7jg9p/kMzvB5bbzw6qsvwK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767325018; c=relaxed/simple;
	bh=ZFh6sbnMiqU40BhHiwRb4Lk0spJ9xqyu0zYvhnvQAmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7tEJ8t0JdjQsYRZG3qYSndyxms8UArwQgOTwn3Rtq+Z+sI78k+z1NB5NvZDfj+3JTBXXOl7kCDNWeMY6QgTkPpvb3o9ksOlu2D8xjgKeNcAQf3f54eoQ0mE3JmJdqUe4IlLJdyL37tkDu5II+YueAGk1DQmbNLfZWboWKzHulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pTaYtOs3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pTaYtOs3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=CCADNODAysl5SsmyV6gnDc5Zrg5GvpzHuDUd2rEQqhk=; b=pTaYtOs3xaGAOeQPkTMA7eo0og
	8bv+G45xRwbkJ7bS60Ty9eCYIN9msmoyP9Qe5yrmYM43aQXQN7eI5T4MsYQ0JlOO7e60ZGCffx0KU
	M44nlZVY/HUgQdKukZqti8PpjQ/yy6SW1Cec31v17FHrxE02tNjyuNmtCgEjmTCJzEnZz8mopd1NG
	3DiQgPumOsF249UN0c0MpZ4FD72p5IJ0uBdpztdlTT1dqoaCnNBpTX82LdVhG/lGWGlPC20on2AtU
	PKUuLalggIDvdDcYOQOKddWORApqRzSxfJq89Dhua/fgQJg/JiOVAIXxDyz0O2rItsAvdCXFpC2NZ
	zylBBuqQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbVy6-00000007kex-2zrN;
	Fri, 02 Jan 2026 03:36:50 +0000
Message-ID: <745448ec-d69f-4f0c-ac02-08c5d757569f@infradead.org>
Date: Thu, 1 Jan 2026 19:36:48 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1503/2671] htmldocs:
 Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline
 emphasis start-string without end-string. [docutils]
To: kernel test robot <lkp@intel.com>,
 Benjamin Coddington <bcodding@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, linux-doc@vger.kernel.org
References: <202601011410.4vVaIDB9-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202601011410.4vVaIDB9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Benjamin,

On 1/1/26 5:27 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> commit: 977de00dfcf87e8d95f55dfc247955dc2f9da14d [1503/2671] VFS: move dentry_create() from fs/open.c to fs/namei.c
> reproduce: (https://download.01.org/0day-ci/archive/20260101/202601011410.4vVaIDB9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601011410.4vVaIDB9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    ERROR: Cannot find file ./include/linux/dcache.h
>    WARNING: No kernel-doc for file ./include/linux/dcache.h
>    WARNING: ./fs/inode.c:1607 function parameter 'isnew' not described in 'ilookup5_nowait'
>    WARNING: ./fs/namei.c:2853 function parameter 'state' not described in '__start_dirop'
>    WARNING: ./fs/namei.c:2853 expecting prototype for start_dirop(). Prototype was for __start_dirop() instead
>>> Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline emphasis start-string without end-string. [docutils]
>    Documentation/filesystems/api-summary:56: ./fs/namei.c:4943: ERROR: Unknown target name: "o". [docutils]
>    ERROR: Cannot find file ./include/linux/buffer_head.h
>    WARNING: No kernel-doc for file ./include/linux/buffer_head.h
>    ERROR: Cannot find file ./include/linux/fscache-cache.h
>    WARNING: No kernel-doc for file ./include/linux/fscache-cache.h

fs/open.c is not used in Documentation/ (where the lines were moved _from_).

fs/namei.c needs changes like:

---
 fs/namei.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251219.orig/fs/namei.c
+++ linux-next-20251219/fs/namei.c
@@ -4938,7 +4938,7 @@ EXPORT_SYMBOL(start_creating_user_path);
 /**
  * dentry_create - Create and open a file
  * @path: path to create
- * @flags: O_ flags
+ * @flags: O_* flags
  * @mode: mode bits for new file
  * @cred: credentials to use
  *
@@ -4949,7 +4949,7 @@ EXPORT_SYMBOL(start_creating_user_path);
  * the new file is to be created. The parent directory and the
  * negative dentry must reside on the same filesystem instance.
  *
- * On success, returns a "struct file *". Otherwise a ERR_PTR
+ * On success, returns a "struct file \*". Otherwise a ERR_PTR
  * is returned.
  */
 struct file *dentry_create(struct path *path, int flags, umode_t mode,


Or                         &struct file \*.
without the quotation marks.

-- 
~Randy

