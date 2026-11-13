Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554271;
	b=R+Zxb0cn1jY8UtJCF0vDME3fImuRYcRH0AHqa6uC4nYskwWXzhQmtGWoDCEBwFHcNQyh
	 XI5qrWDz1hvAk+3DQavKXzdm7lP4HPP1jFWtMvDM4yK9URtEEDzkBFt1XZNvCT7MuwCxW
	 P0n+5Hz8SEdFTdPPZxCJbAivd7pJoNRqI0xOaw5tG0NNTSo611HKa+QrCpp8oMCra2rBC
	 ly7hfEbtWW/sJuNR+2/H/5ytFeB5q/J5c1PVrZGLlA8upjWwn0mgbEbrWDrn64CtFLeDg
	 YYyG6Nv1hvaKEvTPae82sjKSFmHvRr8waVZ/bRBrv+WlWhDYSvCGeswOQM0EK4MM4Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=fV5WOnFWS4qmlmCQnN6uviVor4/nC4eX1sEtnmtdKiU=;
	b=aiX7iTdGbh49cen2e/kiBTHYh+oFmShePvVs+x6vboALDJCO4Z/bM1d60PzsBOSDOQqk
	 jf79o12cjbx0hs6JdnLWeYgb+N8tNHAAJklSYGFKvcDKtRJ3ySAiFNYYsx/+I91RxuGrV
	 sWRjP9/I0nTOhCzrySntdWwRdjXjA4MCTOcpIz35QNa/jkd7/2fwrxlKX6x7z/qN8H+aN
	 VIhKro4RX5slYp1OUv2jAv819FHF1UOXh7CIpzlfPFc2e6X4hCr9bH8l1cfkoei2KcPmD
	 1mH+26eB5/ZPWheowE4eoKYbpSomVJE+xkduMfDjpvLwuO2anVMtWHxCS3ptHIsyqQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=cryspen-com.20260707.gappssmtp.com header.i=@cryspen-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rDoPZtFj;
	arc=none smtp.remote-ip=74.125.225.137
Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C914B606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 07:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C914B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cryspen-com.20260707.gappssmtp.com header.i=@cryspen-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rDoPZtFj
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-4ae596853deso1229275e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 23:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryspen-com.20260707.gappssmtp.com; s=20260707; t=1794554269; x=1795159069; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fV5WOnFWS4qmlmCQnN6uviVor4/nC4eX1sEtnmtdKiU=;
        b=rDoPZtFj9uPCEpHIr6sN/7j/iEeVW8lW9q5YL3iClp0/1QWZB2zyaRFomwt4anuVQ7
         qH1Qq5JGFR8+4fYVBDwow8t+zuGFyO14he6ADuRtQ4D/G6niHPejeQYnihP4d+ht3RiC
         lxfCdNYroOmHqt4oNMkPwtVDrNsC879ff+syCIpm/T3d3Ay39vmBGnVV7PYByZMChqLN
         otSn1R6Rw8wuwNKlZqAssQHpCivayxKTOwkdcQwkWCk3+YByeU6Ktc1ifMCjLSHiTS01
         oIdpjZmwA0pky9Fq3nfTIdEdCcoLbWe8XhQVcnDEvIZVUnC10f01TOdbkYHYMzEPXtBT
         cizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554269; x=1795159069;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fV5WOnFWS4qmlmCQnN6uviVor4/nC4eX1sEtnmtdKiU=;
        b=LQfk3X/2j2CpTrUzF5atlxAH46gc5P/5IWjxl9byq8jLJk+0AFGZQRI2vmMiIwVmgc
         dB2mbcBYm5HW3UgbQ/m+z5qkvBqWQF8RtxmC4WCDsoplIgXzoTgephmsIxTXC34UedsM
         O9hVC9RxMFlB3hcLLssYs0iQMtmvDsaCvP+7eH8f1MsWobrockMvrz2ohnH5jw6++5m5
         wmJe+MttGk/CJ2IaG4jC4oWIyl+/D4JtICDFPayZZy9vzQZnKzXmaElTBSEuOrs/ycbc
         RQHTkp36v2+YLWr+dIGPbem4Hr56JI5GxY6bflmEi27fvbzcN+kXtW99VPhO8vAbfLwz
         6t7Q==
X-Forwarded-Encrypted: i=1; AL+hErElub+EexhYMcqaA+R0n9AyBpf+yuMXuwi2ljrC39wf64hXBLDZU3lnyxWiOHgIUZJ0lmVff9Fi5MLoVANf@lists.linux.dev
X-Gm-Message-State: APuU4Z8rqzG3/kdnT+ai+wZHVc7i1kuY/ABtq/ri/XBANZvod7S7MG6Q
	WOUquk1R0/lXbA3b82JDv32gkSxQvWletzMK8KOTBv40rkewUB72uXaUvErlzJPOsdM=
X-Gm-Gg: AYBFou3dTZLTh/cJOWc4A5U5/EVnr2PS9Q8EpNS8pd24WlsyfVernEk+/oFJ/A0u7zF
	DhM1dhRvEUO4uCMwA9qWO5IrOXNJKeGvukmNWcZjI7WztnQc3oZQgE7KU3ufgpRKEZWOJRJ2pzv
	poJ7v9nohHrwpJVZWKL64A6vqsv7dIaC4CHaxuwzr0u9M7OwulRPUADU3JuNAxcEGg/4prc9/Xl
	lcoVcy3BcT3atJ/dOV7LE7gUtHCWiP+kb/JBO/cRT1o0dk7NNlA4dF7f+ngO3Fcsy56FcUYUhkR
	fJxQfcA1OtmG10V6C5j9u+NgQgXSkowM2bT08AIDmo0CN9HfWYNKqdP2MwrKZvkmuDq93Bqn8ap
	tkWhFtshX0MZXLNvGLE4zSB4Pmv+k76m2UpNZgooctjeUhx00Yzbef5kTQKkPKGNf5UIYzJQXDD
	4Hb6+b5CSRJ5oa0u8JIG5lqZX/8MjOuUKhoYBO4ArHXsjbn2N1Fv3ITJ4PxAZBikAei04A9DV0Q
	kMzILsSrRYoDCE9CfeyFeWg5Sl7WedtAgY2O6U66loze/TF27Z1AM/HDq8MYYdNr9u43N/ajTKo
	JnbEVrjoslwdPPqjDXFKXOCXPg==
X-Received: by 2002:a05:600c:37c4:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4bb55ae3e0emr28650625e9.31.1794554268906;
        Thu, 12 Nov 2026 23:17:48 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a0ffcdsm38845155e9.0.2026.11.12.23.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:17:48 -0800 (PST)
From: Dan Carpenter <dan@cryspen.com>
X-Google-Original-From: Dan Carpenter <error27@gmail.com>
Date: Fri, 13 Nov 2026 10:17:45 +0300
To: oe-kbuild@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-ext4@vger.kernel.org
Subject: [tytso-ext4:pu 13/50] fs/ext4/orphan-test.c:855 orphan_test_init()
 error: 'sb' dereferencing possible ERR_PTR()
Message-ID: <202611121755.hiQrKm5X-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git pu
head:   246d715a48c25a74ac372dda5e10d8f69f89b50a
commit: 8a129f6ffb7e1892ce3c84ba50e50f0f1049383f [13/50] ext4: add KUnit tests for fs/ext4/orphan.c
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121755.hiQrKm5X-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611121755.hiQrKm5X-lkp@intel.com/

smatch warnings:
fs/ext4/orphan-test.c:855 orphan_test_init() error: 'sb' dereferencing possible ERR_PTR()

vim +/sb +855 fs/ext4/orphan-test.c

8a129f6ffb7e18 Theodore Ts'o 2026-11-06   812  KUNIT_DEFINE_ACTION_WRAPPER(orphan_test_cleanup_action, orphan_test_cleanup,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   813  			    struct orphan_test_ctx *);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   814  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   815  static int orphan_test_init(struct kunit *test)
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   816  {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   817  	struct orphan_test_ctx *ctx;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   818  	struct fs_context *fc;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   819  	struct super_block *sb;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   820  	struct ext4_sb_info *sbi;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   821  	struct inode *root_inode;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   822  	ext4_group_t g;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   823  	unsigned int bit;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   824  	int err;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   825  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   826  	ctx = kzalloc_obj(*ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   827  	KUNIT_ASSERT_NOT_NULL(test, ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   828  	test->priv = ctx;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   829  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   830  	ctx->bdev.bd_stats = alloc_percpu(struct disk_stats);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   831  	if (!ctx->bdev.bd_stats) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   832  		kfree(ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   833  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc bd_stats");
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   834  	}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   835  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   836  	fc = fs_context_for_mount(&orphan_test_fs_type, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   837  	if (IS_ERR(fc)) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   838  		err = PTR_ERR(fc);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   839  		free_percpu(ctx->bdev.bd_stats);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   840  		kfree(ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   841  		KUNIT_ASSERT_EQ(test, err, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   842  	}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   843  	sb = sget_fc(fc, NULL, set_anon_super_fc);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   844  	put_fs_context(fc);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   845  	if (IS_ERR(sb)) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   846  		err = PTR_ERR(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   847  		free_percpu(ctx->bdev.bd_stats);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   848  		kfree(ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   849  		KUNIT_ASSERT_EQ(test, err, 0);

Of course err will never be zero, but this condition is an unreadable
way to ASSERT() failure...  Smatch tends to ignore these sorts of
asserts where a complicated condition ends up being always true on
the basis of, "I probably parsed this wrong if people are checking it".

8a129f6ffb7e18 Theodore Ts'o 2026-11-06   850  	}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   851  	ctx->sb = sb;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   852  	sbi = &ctx->sbi;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   853  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   854  	sbi->s_sb = sb;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  @855  	sb->s_fs_info = sbi;
                                                ^^^^^^^^^^^^^
Warning.

8a129f6ffb7e18 Theodore Ts'o 2026-11-06   856  	sb->s_op = &orphan_test_sops;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   857  #ifdef CONFIG_QUOTA
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   858  	sb->dq_op = &orphan_test_qops;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

