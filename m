Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481801DC1AB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 07:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854042; cv=none; b=jiIRIsyKhw4qZvNgJwVmoY7hd9dTlGL1ejvVhBl+lGy8xE2gfvQ9d0JLig2CFQLVy4N38QAID/nky0GPafAFBsrlg0Ge4vosCnSy+ErKULqziVUHW3xTfFZGqOhX96RE90lgDB9xcu4ZRNcmjfvi4KZ9mpQU+9ug2O2ymGyNr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854042; c=relaxed/simple;
	bh=a2NpM7gvVGocc+Vgt1MpfyiSCmRllhFJBDZwEb6mpBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=efC3X1J9NXL2quWFQyl3Vm57eJcdsC+KbpUzwub0nVpcsq1z5gksPDKszJMYICNjFCANVcpele8FJzUvd+ZI0qk8tPLf0jXFc3ocjz5JSJy73kmBullclh+vR+TWd+Vk5SD4GQ9I7+tuADAWwk2vkm8Ybg0fW88sb92o8Ficqrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7BOcEFN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7BOcEFN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso1219973f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 00:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774854040; x=1775458840; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Znm9+UsJNTdKT8r91hnoKvLjBMEEPGA+MIJkGcn/jeM=;
        b=k7BOcEFNAc5k2cNm/ZwS9bv56+zxt0OREqSIyWkVT3Bp7odM979zHXWzqxl0Kjc/X4
         VbdvZGBfr4iiPZvQnL901vGdtpqUNt+An9LKtYKuZPcd6IBC2WsFzLlWLT5xdPM3NSfM
         hXr2dajkN81OKfztjE9MdixhwPrEtgUK9gh3QaO+62BKvPwL0NAw84An8RzDsISo/cTz
         Z7Va2Wtmc3oQ9v6ZhmtClAThPvszyHx4fvuj6B1Y7PXXmhc061Sdz3wRKjDU04Hb8bvW
         ufggDoxRiLxV07kEo4ATLn03YY3qqGwWAlmbrbQN43gN2wlB5FPoX4zUHg4uNHrVpXtj
         jsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774854040; x=1775458840;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Znm9+UsJNTdKT8r91hnoKvLjBMEEPGA+MIJkGcn/jeM=;
        b=LJiPDrj9xN9eLgXFDC6ePGS5k1HHn7/LCfENDXyaNDmNpBR7dyQHV9FuAC738uC7Vo
         UdHhXc7do4OHR1Tme3gKc0lkiQMHzbySG8gws/5q+kQXF8tKQjXtJaTRPByoD7wgFC1S
         kt3R+Hips8oZMb+dpDH4rKaySzgI6O5g8APPdfs9M2JIC4AfX96COVF0n9MxKSCDKMav
         XqlJA/UkEImxl2UWMeXp0ytFu5NQ9vGA0xpmsUQiUUWGmllzNWmtPvTCzWFIhc2npJO7
         qkc28FZqFhQ5JAFmQE4BeGi9NXFWRqPLRpXQi0EmlO+ag0/47FlkstH5H3TQPQoSgFSN
         S/MA==
X-Forwarded-Encrypted: i=1; AJvYcCXWQk0dk64DYeiq3+eBnGmyaKzcyPOgX9LbCgrPyQkZ0q8XSPTw6eHPE6vCx0vWAMbdOoiWpKI7k5frM1Cv@lists.linux.dev
X-Gm-Message-State: AOJu0Yzowz4SMPTpzX7KQnYGNH9rxKA2RS3/Ye9r9qMrvEKZ7khmNH0d
	evX5mMnEHRYTZGKLDIe5Oz7vdBINAVZGP8crWNvMTY16SGEnzQ8PYizo
X-Gm-Gg: ATEYQzyp/i7cDlyfeRwbrcTB8wSzK31j5fZPB35s/0t0xxu0W/vW8/ugWZKrH0T9sPa
	F2MjgwBaSzwO08aku05ud6pf3GqPkHdqv9Cfzi5Cls7kQmToQqko/CGf0xibLO2ofXJk79zNjU3
	Do/LQDV2pr4nOGElfV3TW52TPUB0NvCzNHH12xKFGSH+HnoG7gwaZDuJJc7BtuM83+l5XbhX+uK
	mjUEMCO+GCAB3ov9ofwVySZLLs9a0zEb7dhyRP3uDOFaupxWBZoapuSfgkGwn2k8R7UeYwz+Mb+
	oExO+L1fGnc+SyN7hLT4ZpMem/irSqgjXzgvCIbEMlP0JZdITp2QDEJSyNHMzFqlOe2bp7seH0t
	Ax39OIM6jks9z0ySKVD6eqh2gNU0ouZCmmEqy8aV7rjUDlPuJg+C8G2Y/ulCRLhs4k4jgQvduuv
	ioFO+X+sYqc5FBU1ZyQV0=
X-Received: by 2002:a05:6000:2511:b0:43b:4d25:95ac with SMTP id ffacd0b85a97d-43b9e987ae0mr18400469f8f.1.1774854039117;
        Mon, 30 Mar 2026 00:00:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2487sm17621939f8f.5.2026.03.30.00.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:00:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:00:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 7/7] mm/damon/tests/sysfs-kunit.h:80
 damon_sysfs_test_add_targets() error: dereferencing freed memory
 'sysfs_target' (line 79)
Message-ID: <202603290111.IIC2UeIB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1eeff75d058d17b506a97fa282e7bbb55074c8d1
commit: 33cf4171196debf6009e33d96dccdd7929071db5 [7/7] mm/damon/tests/sysfs-kunit: handle alloc failures on damon_sysfs_test_add_targets()
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290111.IIC2UeIB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603290111.IIC2UeIB-lkp@intel.com/

smatch warnings:
mm/damon/tests/sysfs-kunit.h:80 damon_sysfs_test_add_targets() error: dereferencing freed memory 'sysfs_target' (line 79)

vim +/sysfs_target +80 mm/damon/tests/sysfs-kunit.h

2caef83db9f8e0 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  41  static void damon_sysfs_test_add_targets(struct kunit *test)
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  42  {
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  43  	struct damon_sysfs_targets *sysfs_targets;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  44  	struct damon_sysfs_target *sysfs_target;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  45  	struct damon_ctx *ctx;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  46  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  47  	sysfs_targets = damon_sysfs_targets_alloc();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  48  	if (!sysfs_targets)
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  49  		kunit_skip(test, "sysfs_targets alloc fail");
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  50  	sysfs_targets->nr = 1;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  51  	sysfs_targets->targets_arr = kmalloc_array(1,
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  52  			sizeof(*sysfs_targets->targets_arr), GFP_KERNEL);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  53  	if (!sysfs_targets->targets_arr) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  54  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  55  		kunit_skip(test, "targets_arr alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  56  	}
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  57  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  58  	sysfs_target = damon_sysfs_target_alloc();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  59  	if (!sysfs_target) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  60  		kfree(sysfs_targets->targets_arr);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  61  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  62  		kunit_skip(test, "sysfs_target alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  63  	}
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  64  	sysfs_target->pid = __damon_sysfs_test_get_any_pid(12, 100);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  65  	sysfs_target->regions = damon_sysfs_regions_alloc();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  66  	if (!sysfs_target->regions) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  67  		kfree(sysfs_targets->targets_arr);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  68  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  69  		kfree(sysfs_target);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  70  		kunit_skip(test, "sysfs_regions alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  71  	}
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  72  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  73  	sysfs_targets->targets_arr[0] = sysfs_target;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  74  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  75  	ctx = damon_new_ctx();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  76  	if (!ctx) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  77  		kfree(sysfs_targets->targets_arr);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  78  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @79  		kfree(sysfs_target);
                                                                                              ^^^^^^^^^^^^^
Freed

33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @80  		kfree(sysfs_target->regions);
                                                                                              ^^^^^^^^^^^^^^^^^^^^^
Use after free

33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  81  		kunit_skip(test, "ctx alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  82  	}
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  83  
2caef83db9f8e0 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  84  	damon_sysfs_add_targets(ctx, sysfs_targets);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  85  	KUNIT_EXPECT_EQ(test, 1u, nr_damon_targets(ctx));
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  86  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  87  	sysfs_target->pid = __damon_sysfs_test_get_any_pid(
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  88  			sysfs_target->pid + 1, 200);
2caef83db9f8e0 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  89  	damon_sysfs_add_targets(ctx, sysfs_targets);
d96727a251fd2b mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  90  	KUNIT_EXPECT_EQ(test, 2u, nr_damon_targets(ctx));
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  91  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  92  	damon_destroy_ctx(ctx);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  93  	kfree(sysfs_targets->targets_arr);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  94  	kfree(sysfs_targets);
2d6a1c835685de mm/damon/tests/sysfs-kunit.h Jinjie Ruan   2024-10-10  95  	kfree(sysfs_target->regions);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  96  	kfree(sysfs_target);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  97  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

