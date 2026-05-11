Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747E3BED7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494071; cv=none; b=bykI7XHTve/5nuu8GdubqAHO0mHp7Xph2ozWIfOCAeHmFf1Sc5iyvLmeAYh6LvNoT2BF+Qb7lfQTvM6+lABZglP9mUa9FywNliniROVydy+SS3WjGwtK2OUMFqG3Ipg5FPbxvToNG8bT78j+CQ6RKmitAPfEMs/gosdNxonBbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494071; c=relaxed/simple;
	bh=HU+M5WS9cqkNkxbtdT9twppB2xjkUtjMUTKdg3QWBFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZXKNKP5EgEzW95pJMcvgmtZj//XK1C5AhbMvoX0ecCoXPWQN10qKBHZsaNs8E2yEvqmN1Bgh4/lscChTglCl6EGbXtZb6qnyXJem7fao2Bvj88dSE4RXsySipx6/sAZf6urdwJUQpSHXyQmQdLOTAI3JljsVYAWuHH3wxHZRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhJNYl2x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhJNYl2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E27AC2BCB0;
	Mon, 11 May 2026 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778494070;
	bh=HU+M5WS9cqkNkxbtdT9twppB2xjkUtjMUTKdg3QWBFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhJNYl2xquuOZresI2IU9lbHe1u/uY6LAMW9RxCFYLPerIObFcRc6IDdvmRdEyyL9
	 bJNzhrcmdfju5W3jpAPhp6IQkS7DVk33ST4QJngND04K3Gi8oaHEwSYP6wjv/dw/F1
	 tdMD8S8d93uvJNn04WRN6lkjQAwpE0YjYcW4tDKVJzVAh1m97LXALq01XP6pq7lnME
	 pn7NdedsFH+JFcf6sAko/kFCHketBk5FikwLoml/do7+baeHQhXTXybrDUurF8PA4Z
	 dTGSckr1qqOIHdEL90kvIebuM5UrHdHPWsJVe+S5WZomg5KaoqRbRXPm59T3n/8ki7
	 b9YW94ArXczPA==
Date: Mon, 11 May 2026 12:07:46 +0200
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Dorjoy Chowdhury <dorjoychy111@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, Christian Brauner <christianvanbrauner@gmail.com>, 
	Jeff Layton <jlayton@kernel.org>, Aleksa Sarai <aleksa@amutable.com>
Subject: Re: fs/smb/client/dir.c:248:10: error: use of undeclared label 'out'
Message-ID: <20260511-ausziehen-wahlkabine-30b5f5e0ede3@brauner>
References: <202605020138.EI8o7MFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202605020138.EI8o7MFz-lkp@intel.com>

On Sat, May 02, 2026 at 01:27:11AM +0800, kernel test robot wrote:
> tree:   https://github.com/brauner/linux.git vfs-7.2.openat.regular
> head:   be7728badbd230f1ee7beba4162383fa022ae767
> commit: 93306cec35846eebf467d63a775fa711d7106b2e openat2: new OPENAT2_REGULAR flag support
> date:   2 weeks ago
> config: i386-randconfig-141-20260501 (https://download.01.org/0day-ci/archive/20260502/202605020138.EI8o7MFz-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> smatch: v0.5.0-9065-ge9cc34fd
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020138.EI8o7MFz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605020138.EI8o7MFz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> fs/smb/client/dir.c:248:10: error: use of undeclared label 'out'
>      248 |                                 goto out;
>          |                                      ^
>    1 error generated.
> 
> 
> vim +/out +248 fs/smb/client/dir.c
> 
>    199	
>    200	/* Inode operations in similar order to how they appear in Linux file fs.h */
>    201	static int __cifs_do_create(struct inode *dir, struct dentry *direntry,
>    202				    const char *full_path, unsigned int xid,
>    203				    struct tcon_link *tlink, unsigned int oflags,
>    204				    umode_t mode, __u32 *oplock, struct cifs_fid *fid,
>    205				    struct cifs_open_info_data *buf,
>    206				    struct inode **inode)
>    207	{
>    208		int rc = -ENOENT;
>    209		int create_options = CREATE_NOT_DIR;
>    210		int desired_access;
>    211		struct cifs_sb_info *cifs_sb = CIFS_SB(dir);
>    212		struct cifs_tcon *tcon = tlink_tcon(tlink);
>    213		struct inode *newinode = NULL;
>    214		unsigned int sbflags = cifs_sb_flags(cifs_sb);
>    215		int disposition;
>    216		struct TCP_Server_Info *server = tcon->ses->server;
>    217		struct cifs_open_parms oparms;
>    218		struct cached_fid *parent_cfid = NULL;
>    219		int rdwr_for_fscache = 0;
>    220		__le32 lease_flags = 0;
>    221	
>    222		*inode = NULL;
>    223		*oplock = 0;
>    224		if (tcon->ses->server->oplocks)
>    225			*oplock = REQ_OPLOCK;
>    226	
>    227		/* If we're caching, we need to be able to fill in around partial writes. */
>    228		if (cifs_fscache_enabled(dir) && (oflags & O_ACCMODE) == O_WRONLY)
>    229			rdwr_for_fscache = 1;
>    230	
>    231	#ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
>    232		if (tcon->unix_ext && cap_unix(tcon->ses) && !tcon->broken_posix_open &&
>    233		    (CIFS_UNIX_POSIX_PATH_OPS_CAP &
>    234				le64_to_cpu(tcon->fsUnixInfo.Capability))) {
>    235			rc = cifs_posix_open(full_path, &newinode, dir->i_sb, mode,
>    236					     oflags, oplock, &fid->netfid, xid);
>    237			switch (rc) {
>    238			case 0:
>    239				if (newinode == NULL) {
>    240					/* query inode info */
>    241					goto cifs_create_get_file_info;
>    242				}
>    243	
>    244				if ((oflags & OPENAT2_REGULAR) && !S_ISREG(newinode->i_mode)) {
>    245					CIFSSMBClose(xid, tcon, fid->netfid);
>    246					iput(newinode);
>    247					rc = -EFTYPE;
>  > 248					goto out;

This should be a direct return. I folded that fix.
