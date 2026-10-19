Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0F390C8A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 07:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393669; cv=none; b=DFGXJu5o7u9LDTOl3atOZ46EOvdxKCJJpdpx0XAEpc41i78TluedcMVBFL4Wic0qmdD1wJ1tGYpWwMvrLd6Zib1HUfKzqGP9odW9eSIqrPGb07hJvZWbDT3yR1tPBXIItCOy7AfAXUbBPuDCTC+zVrbM0242Nar87uZ3QUnr+8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393669; c=relaxed/simple;
	bh=S4fQ8XEc+oFAxEWDCpZJ1/B2hbc2+YG7gMyRh1B6L/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mP20bVxYNs3j1dL0OSb82hbCIzuDYmd7WP6Rcbm2YV0Keei6KjA7f61OXFzcGCBWtAxQ4E+OQgAwSpblTklxnGRF7BrP2HxMrdia4pHYcjekmYah6yl3BC7Xe73WDVvHdBCI/279SNEl612yaB1P0525yjmmXJ2MQGOzY++179s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STdMKry3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STdMKry3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956869750eso12715155e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 00:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792393666; x=1792998466; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BogBNmuVEjeeMLqvlyDsF36FOVbrrggoEcqAkpHFhxE=;
        b=STdMKry3iFnhKlQIHk8N/QvJObN4v3Xik0XDl8dsrjqkvJxK7vkUKDYywLira7lKw1
         wEOsV9oByc2LFm7jSltMJAAdjUMtAzXZYphCbz2QPgyae6gPdrLv++TanH5za+eQv2mx
         ACH2xR0lpGekT/IPGBXkjcREntm2z9fYTBLJ1iULK8iVa1qWzvCtxyMwz/qqnUE7i+IF
         KO8QEyOBTEpD6JrUmGerKjd/UULJq982IndTv7Fq2tLw9iBnJAJmfNddQ7uVvvWq71Me
         WnuGvBiR15fB8lUt21jCJuc6yJE+ojLTnQubRsqRcjGWTHCi9I3MGzRHYE2C95FqyjTH
         ifnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393666; x=1792998466;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BogBNmuVEjeeMLqvlyDsF36FOVbrrggoEcqAkpHFhxE=;
        b=BJyEG+RksWZ4uoJoJz34zR80WxIce7tH32gkrZlwzqKBGnMQmufd8xcb+sGEqsFa2T
         zudmb5YWsjIQEOjKir/vvdCXYoC/2DC1AawA6Dnq217nm6EWN35p/cySxwvG6F10yb41
         wAbpamvEcQ1jzt6Vr1lF2ZI+fCDM7Y9hNUzGGfD4UZXnOJzkJkVu/by+a36zK9TKMlYD
         5HzJ1zSMqjaV00eRRbDbOE8nl7NjbiXRquAsxCqdAZc8T2BtF5K8OZRO08ZmrOGWFv7g
         yAjSOSu1hEkKTHve+Lj4oF4KO/2dV5Jme4iWzfVixhFZmHP8ahfwaq5+ERnjWqglZFSx
         ar2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9uVcCVRWwjlj2QTRsfIJKOYqDXVkn/UOn9/eRdSWPmn19lSrVSoezGAY/UHha6XyCj/syN8vUFOjqfvoF@lists.linux.dev
X-Gm-Message-State: AFq9FYL6kijA9aKgz21bbcDfy0FFKuw/bhe3GZGqHp2I/lVufARTHfVB
	G3NStFrGIyRGwhf97HfnrH1vp6Porutpc8YqUPKG3w0AXHO12CJQjZYB
X-Gm-Gg: AYBFou35JgSQIa6uWI6nZNep31HLidhL35uDJYEkRmeihCvEsRtzkfh/NZe2y2KbVp5
	wCmVzZfL0PITDu8uQ74P5qr4bfWDdRgN03DZ2gtF1N9XrTK+vsPQAwCJORYMmhS4VelwWnJ5Adk
	p/6so+ExLshsX0cXET4gjqDx30R/QB8BkxZwsUSjfDwxHGG+XCH41ZYkSxDFnXlhh1A/yDgA98q
	RNl+jhJqKbsi+dyEfCqMxriciv0EDc5c7sd+lbwAcXBIY2dmTJvbYNsusTYA7EN6LatxJUTqAO5
	qOGdXNpDFJIzfTvqDhXwHiV42lR1jMKGvlpe6QG4lmV1fhjhA+cqUjeByeqTK3oB9a/NU39xbeU
	t3KdoSIviSpvkbe7gBIovTUFD9g0zPXiRKLNgW9rdaBbiEzIcmuxcqq3WxbODW89sqpstkmy+/2
	SPgxGdHtWhpWnlcWMKsBK0Ql6v7jVq5NN7Cm8WIKWMVPCIuOFdr0Gwc5RkiOCrg3N/tEQ=
X-Received: by 2002:a05:600c:5492:b0:4a1:d992:9476 with SMTP id 5b1f17b1804b1-4a1d992951cmr127787035e9.23.1792393666098;
        Mon, 19 Oct 2026 00:07:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4fe9d9sm20109761f8f.40.2026.10.19.00.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:07:45 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:07:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn:
 signedness bug returning '(-61)'
Message-ID: <202610170051.ZaPQhbIG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   a42b417921ddca2df90dc3d8cb746eda8cdb6d63
commit: f615e8d2dec6746127d4667c3cae81bfd6a1ed3a [1/1] misc: pci_endpoint_test: Give disabled BARs a distinct error code
config: i386-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261017/202610170051.ZaPQhbIG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610170051.ZaPQhbIG-lkp@intel.com/

smatch warnings:
drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn: signedness bug returning '(-61)'

vim +292 drivers/misc/pci_endpoint_test.c

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  282  static bool pci_endpoint_test_bar(struct pci_endpoint_test *test,
                                                               ^^^^

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  283  				  enum pci_barno barno)
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  284  {
2a35703a6a00e87 Niklas Cassel          2024-03-22  285  	int j, bar_size, buf_size, iters, remain;
2a35703a6a00e87 Niklas Cassel          2024-03-22  286  	void *write_buf __free(kfree) = NULL;
2a35703a6a00e87 Niklas Cassel          2024-03-22  287  	void *read_buf __free(kfree) = NULL;
cda370ec6d1f7b2 Kishon Vijay Abraham I 2017-08-18  288  	struct pci_dev *pdev = test->pdev;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  289  
f615e8d2dec6746 Niklas Cassel          2025-01-23  290  	bar_size = pci_resource_len(pdev, barno);
f615e8d2dec6746 Niklas Cassel          2025-01-23  291  	if (!bar_size)
f615e8d2dec6746 Niklas Cassel          2025-01-23 @292  		return -ENODATA;

s/-ENODATA/false/

f615e8d2dec6746 Niklas Cassel          2025-01-23  293  
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  294  	if (!test->bar[barno])
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  295  		return false;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  296  
834b9051992580a Kishon Vijay Abraham I 2017-08-18  297  	if (barno == test->test_reg_bar)
2a35703a6a00e87 Niklas Cassel          2024-03-22  298  		bar_size = 0x4;
834b9051992580a Kishon Vijay Abraham I 2017-08-18  299  
2a35703a6a00e87 Niklas Cassel          2024-03-22  300  	/*

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

