Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF38266F10
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104272; cv=none; b=Xhm3aoOKNsVZ2poq9oGCDWW/zdZX6/VZmjPA4NVbi8BnUsGg8qhMsOD2Ml3PjzuEiYIZy+FsvUZyWDTjQLZ+JA8xbv1XOLm0OgJBN1MYIf64gNvskIyt7N0EJVBWoxaNBHyaoGDx2i7wigFGSv//lO1TNUGEGaSieKeZ3Q/SlXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104272; c=relaxed/simple;
	bh=z/YYHSDP5OiBT1IVFnhj6iYiK5JQBUpCh9hrGi5lzkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHPfBmeDYviNeOXKWed8r6YEN5I0QVlHd0lC4zcBnJGBen6Sjs/CNjoxjxU+jyL6Z10TKOhjUob4D9TazZ4Trw74w2QOAqFeCQ12eeqxt7S83FqtX/QSnU8gOicZ70DvRowTlUt6ClabzemQNDVrSHRVGyxa0cK5yN048j6zACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfbn7Q5F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfbn7Q5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96896C4CEEA;
	Tue,  8 Apr 2025 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104272;
	bh=z/YYHSDP5OiBT1IVFnhj6iYiK5JQBUpCh9hrGi5lzkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfbn7Q5F2aAogn5d5nEfPnZh4sQ/8ykuWRxmStmJLO4xAuci8xWUwElWdwfK3KBeK
	 MvsxXobXytsz9pxrQwOaphXddR2igFB0+VSL270b8bWBGbhTacs3hdUzZwCWx8jYUH
	 G1lhehaU2hsQZ7qZaJLNF2/14hYAOIXTfHX6sych6uNy0giUbpmS4iDkZPMFIg96JY
	 mHjSggIp0zpYUmxJZ1PYiiXnYFK81wb8ToZQXM3ZT9gBdidcKMDIyQreYul6NDdasQ
	 /WLi9BmMMpovjX8HD+fc7b5PguO3gpEhUC4dlUHLyM7j9YcQlGicGauNdD5x7K4vua
	 UHUmKrAkKTovQ==
Date: Tue, 8 Apr 2025 11:24:28 +0200
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: NeilBrown <neil@brown.name>, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 1231/1936] fs/kernfs/mount.c:258:57: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <20250408-hinkriegen-einwohner-2c1988e5b662@brauner>
References: <202504081746.zMqyeksR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202504081746.zMqyeksR-lkp@intel.com>

On Tue, Apr 08, 2025 at 05:15:34PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
> commit: 973256a7be6ed574f242995c15a8aa80cc0cc566 [1231/1936] VFS: rename lookup_one_len family to lookup_noperm and remove permission check
> config: arc-randconfig-r121-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081746.zMqyeksR-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 12.4.0
> reproduce: (https://download.01.org/0day-ci/archive/20250408/202504081746.zMqyeksR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504081746.zMqyeksR-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> fs/kernfs/mount.c:258:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const * @@     got char const [noderef] __rcu *name @@
>    fs/kernfs/mount.c:258:57: sparse:     expected char const *
>    fs/kernfs/mount.c:258:57: sparse:     got char const [noderef] __rcu *name
> >> fs/kernfs/mount.c:258:57: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char const *name @@     got char const [noderef] __rcu *name @@
>    fs/kernfs/mount.c:258:57: sparse:     expected unsigned char const *name
>    fs/kernfs/mount.c:258:57: sparse:     got char const [noderef] __rcu *name
> 
> vim +258 fs/kernfs/mount.c
> 
>    199	
>    200	/**
>    201	 * kernfs_node_dentry - get a dentry for the given kernfs_node
>    202	 * @kn: kernfs_node for which a dentry is needed
>    203	 * @sb: the kernfs super_block
>    204	 *
>    205	 * Return: the dentry pointer
>    206	 */
>    207	struct dentry *kernfs_node_dentry(struct kernfs_node *kn,
>    208					  struct super_block *sb)
>    209	{
>    210		struct dentry *dentry;
>    211		struct kernfs_node *knparent;
>    212		struct kernfs_root *root;
>    213	
>    214		BUG_ON(sb->s_op != &kernfs_sops);
>    215	
>    216		dentry = dget(sb->s_root);
>    217	
>    218		/* Check if this is the root kernfs_node */
>    219		if (!rcu_access_pointer(kn->__parent))
>    220			return dentry;
>    221	
>    222		root = kernfs_root(kn);
>    223		/*
>    224		 * As long as kn is valid, its parent can not vanish. This is cgroup's
>    225		 * kn so it can't have its parent replaced. Therefore it is safe to use
>    226		 * the ancestor node outside of the RCU or locked section.
>    227		 */
>    228		if (WARN_ON_ONCE(!(root->flags & KERNFS_ROOT_INVARIANT_PARENT)))
>    229			return ERR_PTR(-EINVAL);
>    230		scoped_guard(rcu) {
>    231			knparent = find_next_ancestor(kn, NULL);
>    232		}
>    233		if (WARN_ON(!knparent)) {
>    234			dput(dentry);
>    235			return ERR_PTR(-EINVAL);
>    236		}
>    237	
>    238		do {
>    239			struct dentry *dtmp;
>    240			struct kernfs_node *kntmp;
>    241			const char *name;
>    242	
>    243			if (kn == knparent)
>    244				return dentry;
>    245	
>    246			scoped_guard(rwsem_read, &root->kernfs_rwsem) {
>    247				kntmp = find_next_ancestor(kn, knparent);
>    248				if (WARN_ON(!kntmp)) {
>    249					dput(dentry);
>    250					return ERR_PTR(-EINVAL);
>    251				}
>    252				name = kstrdup(kernfs_rcu_name(kntmp), GFP_KERNEL);
>    253			}
>    254			if (!name) {
>    255				dput(dentry);
>    256				return ERR_PTR(-ENOMEM);
>    257			}
>  > 258			dtmp = lookup_noperm_positive_unlocked(&QSTR(kntmp->name), dentry);

This should be:

diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
index 7c908e1c2730..a82fbce25c28 100644
--- a/fs/kernfs/mount.c
+++ b/fs/kernfs/mount.c
@@ -255,7 +255,7 @@ struct dentry *kernfs_node_dentry(struct kernfs_node *kn,
                        dput(dentry);
                        return ERR_PTR(-ENOMEM);
                }
-               dtmp = lookup_noperm_positive_unlocked(&QSTR(kntmp->name), dentry);
+               dtmp = lookup_noperm_positive_unlocked(&QSTR(name), dentry);
                dput(dentry);
                kfree(name);
                if (IS_ERR(dtmp))

I've fixed that.
