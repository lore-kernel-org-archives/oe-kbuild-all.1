Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C5221F37
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455935; cv=none; b=DnslER1xxh2mqjwxPX4Po/WiHbGZNbiyn8tSO7th7HrR8xjzkNgEH1pWAILuZZ8wYIws80ORfTfktX/Ey6jMIud8ikbez1Lwiht4uzQpGBjpaR9bXALloVGU/vFdVd3cbZuO7hprrQhQhlLAby97Dq+OH/3wa2uNSkh0QxFOeZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455935; c=relaxed/simple;
	bh=8c3aao5B5d5K3zl9VsbOpHueQYawZS5TIDF4gkLkUUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EqfjPP6OO4yoDM+/ESZGXzSaNGL8d+YdIvjdoa8SACvZOVrm/BJEUYd20euOt3bld2uGvihzfYFLixsA7yLBdRMR5AIqrD+VD5jJFgEgPRMAs9R8E0qcESGJ4vfCYcqtz3weQ9gdEwcDpx5jk9uTidzXG/TBAYkkPPXee4hyWxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wl1rWehr; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wl1rWehr"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-407a3913049so3500526b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Jul 2025 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751455932; x=1752060732; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x4Y1y13yCkRHmnRCrDrrhpA7TeCfFXTgGMfjT0ToZ9I=;
        b=wl1rWehrOWMgk7vztXIWuznmJJfSbKGEoacCZV29KLbCssUytbYKGbm4rHRBNM48l3
         fxfokeUM3fO2z9U/datN/6wL/TNOUOkjnHhJpgHs7O0ZXQNBOLZ2Rb9/wpLm783IJMJG
         8IixsbCHFkJJd78jF+zqQDUq5owM9NE00GxBYcXJ2mt9MTlYrl85X4e72EYIoUsz5iGl
         44WPgGEonsMRlMKiufn/dQE06WrSHo8r/kzwgch18jubPn4801Kas5KKfveKit6/uWTh
         7YEOKbGNfZdIGiHJm5Z/+LxCjSIVvRRmK5ZuZdd39E0s5ql0W7XUNcHPoUJ1JmN5ciyi
         kzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751455932; x=1752060732;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4Y1y13yCkRHmnRCrDrrhpA7TeCfFXTgGMfjT0ToZ9I=;
        b=WN5nIDBHEB89VUgkkQ/ZkcIWjJ1CK+yjlQllu0J9iRjH4jo1XBQjIGyEdmMVsoOUwv
         GnUcJASAqiOpELOiZPocCrRkzNgM4O+y6xmlbPymvuJyYvIfNwECsnn1/0Xdv6b6gQ58
         0XqlGYcESoFA+RWZ9GyI/qgfOTtmgzAbObtfnQNjYjUnS3dsuJ+jC6n0c8FMmFYx3V5Z
         ILI7z6qpN8jz2fMMDXq9qM1i0sE/XVgJh8N+zRxCq4G6B940KXQr/Uloism2YLxQtc0X
         RlRmealVI3YEcJLtKZFIMUr2fCo44xqUpmJ8Suz3RGNaaenAyDu7RZVKefKN3uNaseT2
         UbBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqjuc5/mX/u5gOucj/f+/lncIHB6UQGIKQMyc1RGyqtqVXezLae4pJZqVKdmm49+yuspauSUaf58nLNgkR@lists.linux.dev
X-Gm-Message-State: AOJu0YzkpUEEcQ5oajo4cc/QXee7CQa7t8eQMRYCdfBBmELCFqU/isus
	+S1urnrwB+fcPIPGzQCmsSfi1UejO+8xhP0F36rU6cnUD8xdqlZL8k4DfxT7U+0Jimk=
X-Gm-Gg: ASbGnctVitDy72IJ/v7lOJw00H4M2M7XhH8nCdjCnD7eXpiSBLQnGwWamcCjQSHx0lz
	XnxWn4uo/cyv8eBM1hiJAnecylFIrlAJ1b+fNLBfTtXK1lD/iRGSwXSlWn8qEuyC+Hju0sQ0/pn
	OUXIApEmiKFchPFlYaSZnK2y6Wlcf1y0UuzpO+Gjk7vdZWEXzncP+absEiB0xDAXW+7uSSMFrFI
	QMOo9Kb3UmlK4OHT6Ga+h0T6scP7vhTEgNGLRf5J38EdeG1Fxn91fCyVp0yEuhVa94aSSUI3PgU
	EuhhuPkbDcqDGLyXKA1Ox/g7LXOvM79HaqZHxPSwyKNpKoFK7jbi1BBYrBZSuengBk46xg==
X-Google-Smtp-Source: AGHT+IFyKq5rEMVPtEgavLoBwXpcrYM8Qxn2pfFz3SJi1lLjb8ePns26Q87Mc61H6XXCimZfAyibnw==
X-Received: by 2002:a05:6808:1b24:b0:404:8e:69c2 with SMTP id 5614622812f47-40b883e942emr1659326b6e.0.1751455932236;
        Wed, 02 Jul 2025 04:32:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b324054a2sm2535930b6e.31.2025.07.02.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:32:10 -0700 (PDT)
Date: Wed, 2 Jul 2025 14:32:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bharath SM <bharathsm.hsk@gmail.com>,
	linux-cifs@vger.kernel.org, smfrench@gmail.com, pc@manguebit.com,
	sprasad@microsoft.com, paul@darkrain42.org,
	henrique.carvalho@suse.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bharath SM <bharathsm@microsoft.com>
Subject: Re: [PATCH 2/2] smb: invalidate and close cached directory when
 creating child entries
Message-ID: <eebd401c-4e31-4282-af33-7dff1503c937@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630185303.12087-1-bharathsm@microsoft.com>

Hi Bharath,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharath-SM/smb-invalidate-and-close-cached-directory-when-creating-child-entries/20250701-025420
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20250630185303.12087-1-bharathsm%40microsoft.com
patch subject: [PATCH 2/2] smb: invalidate and close cached directory when creating child entries
config: i386-randconfig-141-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021119.3IUZ9mSr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507021119.3IUZ9mSr-lkp@intel.com/

smatch warnings:
fs/smb/client/dir.c:361 cifs_do_create() warn: iterator used outside loop: 'parent_cfid'

vim +/parent_cfid +361 fs/smb/client/dir.c

67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  310  	/*
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  311  	 * if we're not using unix extensions, see if we need to set
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  312  	 * ATTR_READONLY on the create call
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  313  	 */
f818dd55c4a8b3 fs/cifs/dir.c       Steve French      2009-01-19  314  	if (!tcon->unix_ext && (mode & S_IWUGO) == 0)
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  315  		create_options |= CREATE_OPTION_READONLY;
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  316  
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  317  
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  318  retry_open:
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  319  	if (tcon->cfids && direntry->d_parent && server->dialect >= SMB30_PROT_ID) {
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  320  		parent_cfid = NULL;

This assignment should be removed because the parent_cfid pointer will
be set again inside the list_for_each_entry() loop.

037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  321  		spin_lock(&tcon->cfids->cfid_list_lock);
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  322  		list_for_each_entry(parent_cfid, &tcon->cfids->entries, entry) {
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  323  			if (parent_cfid->dentry == direntry->d_parent) {
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  324  				cifs_dbg(FYI, "found a parent cached file handle\n");
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  325  				if (parent_cfid->has_lease && parent_cfid->time) {
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  326  					lease_flags
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  327  						|= SMB2_LEASE_FLAG_PARENT_LEASE_KEY_SET_LE;
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  328  					memcpy(fid->parent_lease_key,
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  329  					       parent_cfid->fid.lease_key,
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  330  					       SMB2_LEASE_KEY_SIZE);
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  331  					parent_cfid->dirents.is_valid = false;
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  332  				}
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  333  				break;
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  334  			}
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  335  		}

After the loop if we don't hit a break then parent_cfid will point to
invalid memory.  (It won't be NULL).

037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  336  		spin_unlock(&tcon->cfids->cfid_list_lock);
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  337  	}
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  338  
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  339  	oparms = (struct cifs_open_parms) {
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  340  		.tcon = tcon,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  341  		.cifs_sb = cifs_sb,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  342  		.desired_access = desired_access,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  343  		.create_options = cifs_create_options(cifs_sb, create_options),
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  344  		.disposition = disposition,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  345  		.path = full_path,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  346  		.fid = fid,
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  347  		.lease_flags = lease_flags,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  348  		.mode = mode,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  349  	};
226730b4d8adae fs/cifs/dir.c       Pavel Shilovsky   2013-07-05  350  	rc = server->ops->open(xid, &oparms, oplock, buf);
^1da177e4c3f41 fs/cifs/dir.c       Linus Torvalds    2005-04-16  351  	if (rc) {
f96637be081141 fs/cifs/dir.c       Joe Perches       2013-05-04  352  		cifs_dbg(FYI, "cifs_create returned 0x%x\n", rc);
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  353  		if (rc == -EACCES && rdwr_for_fscache == 1) {
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  354  			desired_access &= ~GENERIC_READ;
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  355  			rdwr_for_fscache = 2;
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  356  			goto retry_open;
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  357  		}
d2c127197dfc0b fs/cifs/dir.c       Miklos Szeredi    2012-06-05  358  		goto out;
c3b2a0c640bff7 fs/cifs/dir.c       Steve French      2009-02-20  359  	}
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  360  
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01 @361  	if (parent_cfid && !parent_cfid->dirents.is_valid)
                                                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
So this check is reading from invalid memory.

129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  362  		close_cached_dir(parent_cfid);
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  363  
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  364  	if (rdwr_for_fscache == 2)
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  365  		cifs_invalidate_cache(inode, FSCACHE_INVAL_DIO_WRITE);
c3b2a0c640bff7 fs/cifs/dir.c       Steve French      2009-02-20  366  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

