Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA82D044
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715943697; cv=none; b=SNSEw9AX9GgrnvpIdc58U8Kn0D5fr2Bk7dK1ali6x0vCAYtK2uEyA25djuy47UbdCerqKyZFBc04YlEvp35/Z1y4ukpBIr+PYyUIvzTbGy2trYalwvEdzuVKRswcCmGQXt3mkixK8a1ffs4x5KDzhqeJIKejAiMzbaXAhEB8ty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715943697; c=relaxed/simple;
	bh=tVRF4RaYBVX+KzaS74RJYVtbLqfxhP6c/vZtg/ARxG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YFYQL32r15KMz8S6meKVix98oIpET7lymqp7AU4vwf/aPCsihgJ1TgH2rJ5IbwgEmpQ8wohoUuSRDfWxD5rZ5HQ1b2YmvCmP2VAMwZZ0CC6klJStnEi84bRafoppOsY//iYGHoUNJI9IZieCDwdUZwBOPxvXcQbFmUMy/+JhOrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZPIwF1yb; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZPIwF1yb"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a5d02b45262so100012466b.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715943694; x=1716548494; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8VnQm4Wzd0jj3I6yb4jC8r7D5oR7hIr9rTTosx/fIZs=;
        b=ZPIwF1yb1HlXUAW+8uCX+9jc1M/5yF3Sedf5CLaKjzcljO7cLScE1To/bH0jtjy/9x
         9eCN0QoyNZocRVFNxFM0Tja0FbSLzK86YYO2SSEnfC3wtDafpDwciFTXbELCGcumzpE8
         h0ZVPRc2Giz+LYTdTkCZtX2lG2x33cHDuNYOWwzB/HDiXYN8VJPDF39b8HTaYmMc5UeH
         VQFOSAsaR183GGQmmKDqTJbi+p6EUvL/l/vNMxbT8VzN/w5B+/mCoHMATYPOEZdzXYHB
         tot1ePQIreIsCzKh5iAh8pzHL6I7UdgLJDnmeKecNzzTCuDZMLM5ZI2FS0xX6tpEI4lV
         u1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715943694; x=1716548494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VnQm4Wzd0jj3I6yb4jC8r7D5oR7hIr9rTTosx/fIZs=;
        b=kDbjtUfbfWHw1MXMekoYv7JxwPp9bhhw53i+wWkmjtOib8ZkDwr9UV72zqZMDjjd1T
         2VC11j1B1vX8iQy65d1AsAJKHi1Wm6bp0XRlC41HW22xtyhLz7yW+fz76yBr8xeSEtBf
         xwy2QAKYuvZ3GkLQJJLRTQKZbioEWtaLnVPiSV13pD/2r/9H3n5323QFvPImmld1n4Qm
         SxPzUKVNm2IWA/aFocBJkAzyYrGJUpjplxveGl+vGHYzlj88oGB5P37C/bUhza4BeFRx
         D543dSHhlOZk5xhaNTLzCVTf2KXmdT7mjF0S8CpVNtY3Vzox485CP2A8twoWY7qCpzj6
         IdEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC4xYHN99k9Fub0x8T21bz8QTPVO/Ia9DpwkrWuEobAkcz8Im170tzlK6hKycuMJVgGX5YNACmnrVmJGM19oLDp5hk67U/wiShnq9Q3w==
X-Gm-Message-State: AOJu0Yx6xQV0GjeXH0KJLY3yabNWVfrl8kjzCx17V95foR8bXmomT4Lc
	2LQvHNXSSrQUizLnq/jUIFEJZJ/i2jj9VEN0nX3YXrfWA7ecRFOJX0hQuQxEEGo=
X-Google-Smtp-Source: AGHT+IGo0vF44PU8Flj2L8GcXH3uM02w5tyFNQ9qE8+bL2lhGta8EhoiS+njX2Y3R8ShLB5wWk0tPw==
X-Received: by 2002:a17:906:8315:b0:a5a:d6c:a30b with SMTP id a640c23a62f3a-a5a2d65f265mr1511949966b.58.1715943694164;
        Fri, 17 May 2024 04:01:34 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01968sm1108799366b.166.2024.05.17.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 04:01:33 -0700 (PDT)
Date: Fri, 17 May 2024 13:01:31 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hongbo Li <lihongbo22@huawei.com>,
	richard@nod.at, anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-um@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	lihongbo22@huawei.com
Subject: Re: [PATCH] hostfs: convert hostfs to use the new mount api
Message-ID: <d845ba1a-2b10-4d83-a687-56406ce657c9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240513124141.3788846-1-lihongbo22@huawei.com>

Hi Hongbo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongbo-Li/hostfs-convert-hostfs-to-use-the-new-mount-api/20240513-204233
base:   git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20240513124141.3788846-1-lihongbo22%40huawei.com
patch subject: [PATCH] hostfs: convert hostfs to use the new mount api
config: um-randconfig-r081-20240517 (https://download.01.org/0day-ci/archive/20240517/202405171154.21q42SWy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405171154.21q42SWy-lkp@intel.com/

smatch warnings:
fs/hostfs/hostfs_kern.c:960 hostfs_fill_super() error: uninitialized symbol 'host_root'.

vim +/host_root +960 fs/hostfs/hostfs_kern.c

2c2593890079e8 Hongbo Li         2024-05-13  938  static int hostfs_fill_super(struct super_block *sb, struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds    2005-04-16  939  {
2c2593890079e8 Hongbo Li         2024-05-13  940  	struct hostfs_fs_info *fsi = sb->s_fs_info;
^1da177e4c3f41 Linus Torvalds    2005-04-16  941  	struct inode *root_inode;
2c2593890079e8 Hongbo Li         2024-05-13  942  	char *host_root;
^1da177e4c3f41 Linus Torvalds    2005-04-16  943  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  944  
^1da177e4c3f41 Linus Torvalds    2005-04-16  945  	sb->s_blocksize = 1024;
^1da177e4c3f41 Linus Torvalds    2005-04-16  946  	sb->s_blocksize_bits = 10;
^1da177e4c3f41 Linus Torvalds    2005-04-16  947  	sb->s_magic = HOSTFS_SUPER_MAGIC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  948  	sb->s_op = &hostfs_sbops;
b26d4cd385fc51 Al Viro           2013-10-25  949  	sb->s_d_op = &simple_dentry_operations;
752fa51e4c5182 Wolfgang Illmeyer 2009-06-30  950  	sb->s_maxbytes = MAX_LFS_FILESIZE;
ce72750f04d68a Sjoerd Simons     2021-11-05  951  	err = super_setup_bdi(sb);
ce72750f04d68a Sjoerd Simons     2021-11-05  952  	if (err)
74ce793bcbde5c Mickaël Salaün    2023-06-12  953  		return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  954  
b58c4e96192ee7 Andy Shevchenko   2020-03-20  955  	/* NULL is printed as '(null)' by printf(): avoid that. */
2c2593890079e8 Hongbo Li         2024-05-13  956  	if (fc->source == NULL)
2c2593890079e8 Hongbo Li         2024-05-13  957  		host_root = "";

Uninitialized on else path

^1da177e4c3f41 Linus Torvalds    2005-04-16  958  
2c2593890079e8 Hongbo Li         2024-05-13  959  	fsi->host_root_path =
2c2593890079e8 Hongbo Li         2024-05-13 @960  		kasprintf(GFP_KERNEL, "%s/%s", root_ino, host_root);
                                                                                                         ^^^^^^^^^


2c2593890079e8 Hongbo Li         2024-05-13  961  	if (fsi->host_root_path == NULL)
74ce793bcbde5c Mickaël Salaün    2023-06-12  962  		return -ENOMEM;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

