Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77F42AA5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728824966; cv=none; b=Qdu8BGMl2P3fbaddI4JyiblVP5ADymJDAUVI8ke4DsLn68gUmWA6FXS4PKNIGhEF57mb6rg2jS4L7PbMtU7YVjg8ITcfe6wNgV+fB2hV0VqdpMrRDGpWQYl2BtExxbL5EnNm5c30YvsztCFd6KUd3GgidDn9Bs7FmPRj0EuZEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728824966; c=relaxed/simple;
	bh=n/19Dvu1ac0UDr/mG/D1O9a/wIUB2NX6eJ8S83h98nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzW3ZnQybqRLeU4cA5p68bFJDYXCxS/CQaBPyWG5KSMKiIWsjBRuwrh2zkJofAPNDnucMBOEq065mp/Ir0l1Mk2yg4E5IVm9anbbtMyfsbhRAMRIFKNosETHX13b95E5rTEAPhT1S+fArdk5AxeIjGbQRQzffOMM9mF6oYbhAR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZ4qMhsd; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZ4qMhsd"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99ffeea60bso79316066b.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728824963; x=1729429763; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Zv+kEIHpU//ig//dBI7Wx9xh1LxVyQeALvuZYxtCqQ=;
        b=MZ4qMhsdgXAmCfSkYn52jLkh/aeLTwlOD7FI71FM70Q6111JpXp9WBeYI/siFWbqhe
         BA6BYBBI7d7JBny90clOqisy5vOFgyfzzi+r3Opgm41LOZEi48w5pULh7tANfjQoWmwm
         2T/KN6CcUD/MSagFl2ZtK78FiceBYQetV5NoGHUeIr2Q6OfzHfChS2emF1eYegGeYp5u
         7mnfl02ix79NZ5hpO+9Or5eVX/c1mbbYI1u3xjM9oOr1onCSMQHOfwNMWPp+XfXn1eaY
         c9BaNccCxo7kFJx91WVonnFrPafOPZFYERdMZikfx11+jyDwD83P1X/ssXe8GoZZG4Eh
         JeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728824963; x=1729429763;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Zv+kEIHpU//ig//dBI7Wx9xh1LxVyQeALvuZYxtCqQ=;
        b=qXYq0P1FWivpybcWgAXW4mPDLWVT9Q/lEPZhCVG0IewnKZ4spm4E1P4vDcyQqWhTnf
         D626Z29D25kSKDsFcfS0qzQIpAsutqq0HAvQmk5RHTnGX2SzCCd1QWA4nPwKvyGclCix
         VRbqEA4HoJCMToqov91VxkUSzfTqtjV+QzAzttIB8/96DuLmlqHv6YkOhrKejwVXttAn
         hZkksVvYAEeblSDmGGJZcjw/S+LT1TeeO7tQetV9UuRohAlFPP2uxodBlO+JTXrPlCG0
         vEjCLk02hikbIqBGJpr3sjJMOC5TXbbhHIq7Tg8FRv27S2r/wLnD6jaQVS3oj9U68Ok3
         UMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWUnF06TCHgwRLtkV2k1h9XWx+CHyObJtJ7c3x690jt8Ek3rlos6R3Qd3LdsZHCdjVFr1TkPCl2cDZ9R2y@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2vbv2aDNdNDZPwwE+PjSHGx0J/z6IdUvxEFk0KLEkCz1OFCTR
	6R+mZmdWe+F1syheVLx2F5H+45mQdiaPawWaw9eL2mJuZ6J8MEMv9G9j7gFC7u8=
X-Google-Smtp-Source: AGHT+IERe1wl5pqPTQvjQcTK9CeRFcNzR6jPuwqBB1khp08XvYqsrdBMci+iJqaok/wT18EDNw7Obw==
X-Received: by 2002:a17:907:9489:b0:a99:e98f:e73d with SMTP id a640c23a62f3a-a99e9900010mr296446966b.37.1728824963408;
        Sun, 13 Oct 2024 06:09:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99e37732b6sm224522666b.117.2024.10.13.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 06:09:23 -0700 (PDT)
Date: Sun, 13 Oct 2024 16:09:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.15.y 115/643]
 fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before
 check 'bio' (see line 995)
Message-ID: <4b6253a3-db9b-4fd7-9d38-d6f93ca98f3c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.15.y
head:   05edc63e1845cdfef35fb1754c91734598959db4
commit: e8e3f1a12d05d0aef2c819664890b540dfb055af [115/643] f2fs: don't pass a bio to f2fs_target_device
config: x86_64-randconfig-161-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121140.XCAgGhdD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410121140.XCAgGhdD-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before check 'bio' (see line 995)

vim +/bio +996 fs/f2fs/data.c

13ba41e346170e Jaegeuk Kim             2017-09-06   982  static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
95ae251fe82838 Eric Biggers            2019-07-22   983  				      unsigned nr_pages, unsigned op_flag,
7f59b277f79e8a Eric Biggers            2021-01-04   984  				      pgoff_t first_idx, bool for_write)
13ba41e346170e Jaegeuk Kim             2017-09-06   985  {
13ba41e346170e Jaegeuk Kim             2017-09-06   986  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
13ba41e346170e Jaegeuk Kim             2017-09-06   987  	struct bio *bio;
a4b6817625e71d Daeho Jeong             2021-08-20   988  	struct bio_post_read_ctx *ctx = NULL;
6dbb17961f46b2 Eric Biggers            2018-04-18   989  	unsigned int post_read_steps = 0;
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   990  	sector_t sector;
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   991  	struct block_device *bdev = f2fs_target_device(sbi, blkaddr, &sector);
13ba41e346170e Jaegeuk Kim             2017-09-06   992  
67883ade7a98a7 Christoph Hellwig       2021-01-26   993  	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
5f7136db829960 Matthew Wilcox (Oracle  2021-01-29   994) 			       bio_max_segs(nr_pages), &f2fs_bioset);
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28  @995  	bio_set_dev(bio, bdev);
                                                                            ^^^
Dereferenced

6dbb17961f46b2 Eric Biggers            2018-04-18  @996  	if (!bio)
                                                                    ^^^^
Checked too late

13ba41e346170e Jaegeuk Kim             2017-09-06   997  		return ERR_PTR(-ENOMEM);
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   998  	bio->bi_iter.bi_sector = sector;
27aacd28ea3b89 Satya Tangirala         2020-07-02   999  	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
13ba41e346170e Jaegeuk Kim             2017-09-06  1000  	bio->bi_end_io = f2fs_read_end_io;
e2e59414aae2c8 Jaegeuk Kim             2018-06-21  1001  	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

