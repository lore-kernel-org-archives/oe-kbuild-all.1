Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B5191F6D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989310; cv=none; b=GepWBNE6ELvtsRg1nUSzx5SaAj+q4B4qnRTH9rw9EQ5ErddfYvKSCZC9qW9jZ6yS6yoLzLOUn5QlAZv+SwSwGSST3t/Li5qBC7y1V4zFHKMV0hb6g5PT5SeM5PcXpJo9rFrdANg9SmdSugYFXMCB8ENorNphad4Dz2b927LHmh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989310; c=relaxed/simple;
	bh=3TKCaIyB5/0opVLcNoQ1gcsKEomRJ1FYv7vspoTx96c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ohUIs5ux98hIRkMFY8fpPKpiPFnTfblmWq8Jp0HXiSBuvoJbRNxGH0E7hM9JwMEgN/ctFz9uzKGmzejJ5KeU1JSDzBQ32sUektTAfY1nIOxqudVxKWysttsWN6NMWTc+w1pxMiWcmp0nwDrsvJxZoUoedTo9BVLxCOJXpKOZaK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UbjgkFWy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UbjgkFWy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so4038495e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747989307; x=1748594107; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YbryJ7vGqluEKazlG50NrGVTXzGTh20PwbvTVePubi4=;
        b=UbjgkFWyGYYxICDx2R1HUaebhHw8y8zNgR8wfLsktPRM/gxhChWrdp5L/va7xueSCZ
         onLwPwzXnMmHruElPZMJXf8ZziQRZleocIr1hegoBg1J2vfvL/qSv037955RI+G8vHBS
         BLP0B4Ub2dOdIFLHkykOM0BEqeu3gs81qIpXkkTFPGBX7zyga1j61kOXIHhyuoR36FYI
         jjZwpqHFDGP/AB6LvULTCt6iVXaQQgqFCtEEjWyWi6u/qB5Veg7oZlsKLvFsvCKywkgo
         emmOtL9o5q6H92vFucLhxswRL+4i/JRqNHKNa0L2t5vYjTIUdRE0yoqEx2wMb+cpLqr0
         nUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989307; x=1748594107;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbryJ7vGqluEKazlG50NrGVTXzGTh20PwbvTVePubi4=;
        b=h4XaB0sb/iBEhhpeYD3aCehcamfSYaJdAfw+YCYrDK3PcOmeuFBs/hbeEXiXE17TTS
         AD0YcY4NxqSw4MUyKQpms6V3cCb42vtKtbFpQaml8bNU/MWVUAm70KlReAB0Dtv05o9V
         YwmK2KXNkc1M/INuwQ9H42QrUtJ8iSD5vdrTj6sn2hO7kaL2/pl8BZs8yYNXZQXjr2Ur
         fFIPT6ruELaTXUcPSkjYpgVPYhAqIQ8TDtG1s4B+zRKWdWAmLdAx9FC1iT1hnhdD/x1y
         EJtLdD8Z6m77JPdV4DvjxeSyfbYbykOO0g/Wy0Y2X6OIMSYayxXb6VlYmEYh2X2GKh67
         AQRw==
X-Forwarded-Encrypted: i=1; AJvYcCVxBzyxgpc6uHQozQYsu+FPRSx+v6L52IFmEpd/E/4o/o+9g8ju+ht7mcQ+ZxEg2njE6W4Pcjr/4IjnWwU5@lists.linux.dev
X-Gm-Message-State: AOJu0YwmMbNpSzggzd2U0cGhTD4dDunhYNuPMmtp4o/Hs26sDfSoxDjI
	JR8nXBz3YUrcqzj2r/4AVcjmhTmjnZTJOSobvJz7mzTXoOQZ2BXAm0EAHMijBSTH6pY=
X-Gm-Gg: ASbGnctjeV6iO4MizmCjK0KohSx8FKd95qWbWjpkXOXdDl4nJ/LUYHoGNmaxV0IcNcQ
	+0dD7hE+IDB4kXb7xnHrBR1BwjITxWuj5uMfTmL36fyyyQ5B4ekYF+hf9aJRQw7KaagQEF1cqLb
	b+mDhVFY6sSrB1iCWdg0kcYK0mtoEuGnwQzS1/K1AGAtRm4+XOgjEgBmgtjuK1KvtVOGL4Utpt9
	03c7Mjr5FQpS8+CmuySfk4dfVL55cRGkhLatLgScuSrHsufzn+pbaxPYBgaI/rCEk6THTyyKeT9
	u3s62FlYNK/tLJ+gEx/q+wX2oZnQrcWNn+Dugs4bPvuZ8qqoJ5iCzJdT
X-Google-Smtp-Source: AGHT+IGDLAMP6aDEKzjJ8nU1sJDp2T3vwd2IHZI+1NwlB0Wm65hoqonKY2iKdd6kvHgAkP8caUNfmA==
X-Received: by 2002:a05:600c:43d4:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-44b533c19b8mr15328325e9.14.1747989306976;
        Fri, 23 May 2025 01:35:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a3648baa6asm23534815f8f.91.2025.05.23.01.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:35:06 -0700 (PDT)
Date: Fri, 23 May 2025 11:35:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anna Schumaker <anna@kernel.org>,
	linux-nfs@vger.kernel.org, trond.myklebust@hammerspace.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, anna@kernel.org
Subject: Re: [PATCH] NFS: Fixes for nfs4_proc_mkdir() error handling
Message-ID: <202505181116.RhlCb75I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516150010.61641-1-anna@kernel.org>

Hi Anna,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anna-Schumaker/NFS-Fixes-for-nfs4_proc_mkdir-error-handling/20250516-231124
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20250516150010.61641-1-anna%40kernel.org
patch subject: [PATCH] NFS: Fixes for nfs4_proc_mkdir() error handling
config: i386-randconfig-141-20250517 (https://download.01.org/0day-ci/archive/20250518/202505181116.RhlCb75I-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505181116.RhlCb75I-lkp@intel.com/

New smatch warnings:
fs/nfs/nfs4proc.c:5277 nfs4_proc_mkdir() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +5277 fs/nfs/nfs4proc.c

8376583b84a193 NeilBrown           2025-02-27  5260  static struct dentry *nfs4_proc_mkdir(struct inode *dir, struct dentry *dentry,
^1da177e4c3f41 Linus Torvalds      2005-04-16  5261  				      struct iattr *sattr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  5262  {
dff25ddb48086a Andreas Gruenbacher 2016-12-02  5263  	struct nfs_server *server = NFS_SERVER(dir);
0688e64bc60038 Trond Myklebust     2019-04-07  5264  	struct nfs4_exception exception = {
0688e64bc60038 Trond Myklebust     2019-04-07  5265  		.interruptible = true,
0688e64bc60038 Trond Myklebust     2019-04-07  5266  	};
c528f70f504434 Trond Myklebust     2022-10-19  5267  	struct nfs4_label l, *label;
8376583b84a193 NeilBrown           2025-02-27  5268  	struct dentry *alias;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5269  	int err;
a8a5da996df7d2 Aneesh Kumar K.V    2010-12-09  5270  
aa9c2669626ca7 David Quigley       2013-05-22  5271  	label = nfs4_label_init_security(dir, dentry, sattr, &l);
aa9c2669626ca7 David Quigley       2013-05-22  5272  
dff25ddb48086a Andreas Gruenbacher 2016-12-02  5273  	if (!(server->attr_bitmask[2] & FATTR4_WORD2_MODE_UMASK))
a8a5da996df7d2 Aneesh Kumar K.V    2010-12-09  5274  		sattr->ia_mode &= ~current_umask();
^1da177e4c3f41 Linus Torvalds      2005-04-16  5275  	do {
8376583b84a193 NeilBrown           2025-02-27  5276  		alias = _nfs4_proc_mkdir(dir, dentry, sattr, label);
4c35d65f4c6f1e Anna Schumaker      2025-05-16 @5277  		err = PTR_ERR(alias);
4c35d65f4c6f1e Anna Schumaker      2025-05-16  5278  		if (err > 0)
4c35d65f4c6f1e Anna Schumaker      2025-05-16  5279  			err = 0;

This doesn't work.  Imagine we are on a 64bit system and
_nfs4_proc_mkdir() returns a valid pointer.  It depends on if BIT(31)
is set whether we return zero or a random negative number.

This needs to be:

	err = PTR_ERR_OR_ZERO(alias);

078ea3dfe396b1 Trond Myklebust     2013-08-12  5280  		trace_nfs4_mkdir(dir, &dentry->d_name, err);
078ea3dfe396b1 Trond Myklebust     2013-08-12  5281  		err = nfs4_handle_exception(NFS_SERVER(dir), err,
^1da177e4c3f41 Linus Torvalds      2005-04-16  5282  				&exception);
^1da177e4c3f41 Linus Torvalds      2005-04-16  5283  	} while (exception.retry);
aa9c2669626ca7 David Quigley       2013-05-22  5284  	nfs4_label_release_security(label);
aa9c2669626ca7 David Quigley       2013-05-22  5285  
4c35d65f4c6f1e Anna Schumaker      2025-05-16  5286  	if (err != 0)
4c35d65f4c6f1e Anna Schumaker      2025-05-16  5287  		return ERR_PTR(err);
8376583b84a193 NeilBrown           2025-02-27  5288  	return alias;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5289  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

