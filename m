Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1D1BC08B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 05:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734328136; cv=none; b=qOKh9InNUhwXYWudFJ85GFkWH72QLIzRBbzYQmh84baLSecuvO4+3FY0bF/fmiG5IB+UOHW/YwYny9zoxFiqLZzLpPYp6S2nl+DpgTSQO44cpJLtzfugc6EdJ8NqCU45ZzbLz73ZU0LaCeU6kAPzyo/Op0Za3SdPO1FADIkPO38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734328136; c=relaxed/simple;
	bh=/QCWHWfIy73DWJhaPOpE2OEyPQDMITc33oRRiVj1RKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y71CtFpyNRv7XINaSXlQpyA5WzSXR2KVOyeH2h2NEp65M50A1HKy4l7e0YNE7kJCZHzlB1fgLXqa4yBIs+ylM12PhVUhyESJHNbHbdju7ayYd7DPH8qZzKVLEuePqm4WLlUCkL4Koy+Zx29GxbFkKsJ0xT01NhuKoJ1zLSVi1dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t/hIdpNO; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t/hIdpNO"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so6472897a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 21:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734328132; x=1734932932; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCeoKmmMGoX25TkpgEQJNOMrGCB+hXl70wv4WZktLqg=;
        b=t/hIdpNOLwyHC6ZRzgQIQg41DFnt1gOUWAplsBr85WW1X+zRKtgK6IjAeqwt/5dNIn
         S0zsn+G6jc9VvWuR1riwSTTjrYXksNEKijf7iYcemxjwReivjQGjOvEc09eAgz9+QHcj
         2eIRroiSZaM7iDB/ZHSGhsBpvnUzrgYKxYaHXn8osFZQr8dwrDPSaTWchvTaXshwbxep
         bImQ9ytWgBmdG1oBKm7ic7rVlGUW83f3qdfpktL0bNlmdTAjRVixoiJuLazqTohS9gLf
         6ETgS0J6DXX8lsjxbDQIFyjheoAcyN3yu5bmuPvG5zlYhOUn65CiibKeM3bgltE2Pd2I
         i+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734328132; x=1734932932;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCeoKmmMGoX25TkpgEQJNOMrGCB+hXl70wv4WZktLqg=;
        b=B2MhaDWqP5oNwT7OxdwwL3Vg15oh9LXkLVhG2KuEycsbCAJdOM0qefD5+tsyKu20LJ
         0ahyhs8duzjJgCAXOyYhhgPe8THJjdqOzEdZbkHwq4cO27FalYhtWpiYq5S20tSJHLjP
         Rnt3uIhzEd//+DYoATotyg4hWAl3qmskapz48GemvXNCugoHn3BXFsDzHziAM+rfX6eT
         kcd/pFwhJeqqGXrQQ5gT+3W+eHt0qXh5Ur0TYfGBF89ODtgHailDqhwiHyU9UEEmdL0Q
         u9vq7YkZiqO1XjHoXU4NxtQfQP0jCuXMIJ0+DPt67dkoPl1ePUhbOAUf46K1O3IwSQGf
         dMlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJJe5hP0FipxR37VntMYqnmpjyULxVZFEjtEvaDDgHmoSyKvC7jqw5V+UNXMb62z1WEUWud/I2S2uDxU2J@lists.linux.dev
X-Gm-Message-State: AOJu0YxkeAaidTDuYHSmj7GHr6OvbxsVR/NBi9zZZPGKebVNEtvQ5GZz
	EzyTjrgnJLWylLSMKpIa0T142i6oF6HyVscljfemJxwDNrGIjwHIbrdNcdSJH/4=
X-Gm-Gg: ASbGncvmMTZQcrjBiuQobPEX2jD2CwyzdvdyD8pAfYFGLH3zYHaEL90c79VqsIMhgIB
	VgtP8xLXfV2WvJqihGz2nu2VAwXIiammsDINW3oZONp+wvkDme49YHBM6f+Wn+INBxLMUWVi86m
	PihqfbPEODvNdugMkqn9yeIeClbfkRPZ+iWFTIKuU5bCrrrf8U2xvJOGAstz9RsElCWyUl8RJYq
	L/lk2jBdP1PT7rvJPnO4IgkmfUWrp/mpgi+FBGswlGvQvnrzxWoBv6xuMiWLg==
X-Google-Smtp-Source: AGHT+IG1C/bzrNpD0d+ZqNeCRw0DTkob0y4lGP0uQPZeen6ILAc1QHt/x0M8KO5o3xaqnSvAweqpUQ==
X-Received: by 2002:a17:907:3da7:b0:aa6:66eb:9c06 with SMTP id a640c23a62f3a-aab778c5c5cmr1061813666b.5.1734328132205;
        Sun, 15 Dec 2024 21:48:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ac49sm289729866b.144.2024.12.15.21.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 21:48:51 -0800 (PST)
Date: Mon, 16 Dec 2024 08:48:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	zhoujiadong <zhoujiadong5@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579]
 drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:851 hifc_dbgtool_knl_init()
 warn: potential spectre issue 'g_card_node_array' [w]
Message-ID: <e713f870-9ccb-475d-85ed-4f828a165825@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: 3d776c92130b1cdb4c9c0e5b7267152ab998fec3 [2579/2579] scsi/hifc: Fix compile error in allyesconfigs
config: x86_64-randconfig-161-20241213 (https://download.01.org/0day-ci/archive/20241215/202412150126.4ROUW6wq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412150126.4ROUW6wq-lkp@intel.com/

smatch warnings:
drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:883 hifc_dbgtool_knl_init() warn: sscanf doesn't return error codes

vim +/g_card_node_array +851 drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c

3d776c92130b1c zhoujiadong 2023-05-09  796  int hifc_dbgtool_knl_init(void *vhwdev, void *chip_node)
02b4d17a9ac62b denglei     2021-04-26  797  {
02b4d17a9ac62b denglei     2021-04-26  798  	struct card_node *chip_info = (struct card_node *)chip_node;
02b4d17a9ac62b denglei     2021-04-26  799  	struct dbgtool_k_glb_info *dbgtool_info;
02b4d17a9ac62b denglei     2021-04-26  800  	struct hifc_hwdev *hwdev = vhwdev;
02b4d17a9ac62b denglei     2021-04-26  801  	int ret = 0;
02b4d17a9ac62b denglei     2021-04-26  802  	int id;
02b4d17a9ac62b denglei     2021-04-26  803  
02b4d17a9ac62b denglei     2021-04-26  804  	if (hifc_func_type(hwdev) == TYPE_VF)
02b4d17a9ac62b denglei     2021-04-26  805  		return 0;
02b4d17a9ac62b denglei     2021-04-26  806  
02b4d17a9ac62b denglei     2021-04-26  807  	ret = sysfs_create_file(&((struct device *)(hwdev->dev_hdl))->kobj,
02b4d17a9ac62b denglei     2021-04-26  808  				&chip_info->dbgtool_attr_file);
02b4d17a9ac62b denglei     2021-04-26  809  	if (ret) {
02b4d17a9ac62b denglei     2021-04-26  810  		pr_err("Failed to sysfs create file\n");
02b4d17a9ac62b denglei     2021-04-26  811  		return ret;
02b4d17a9ac62b denglei     2021-04-26  812  	}
02b4d17a9ac62b denglei     2021-04-26  813  
02b4d17a9ac62b denglei     2021-04-26  814  	chip_info->func_handle_array[hifc_global_func_id(hwdev)] = hwdev;
02b4d17a9ac62b denglei     2021-04-26  815  
02b4d17a9ac62b denglei     2021-04-26  816  	hifc_comm_recv_mgmt_self_cmd_reg(hwdev, HIFC_SELF_CMD_UP2PF_FFM,
02b4d17a9ac62b denglei     2021-04-26  817  					 ffm_intr_msg_record);
02b4d17a9ac62b denglei     2021-04-26  818  
02b4d17a9ac62b denglei     2021-04-26  819  	if (chip_info->dbgtool_info) {
02b4d17a9ac62b denglei     2021-04-26  820  		chip_info->func_num++;
02b4d17a9ac62b denglei     2021-04-26  821  		return 0;
02b4d17a9ac62b denglei     2021-04-26  822  	}
02b4d17a9ac62b denglei     2021-04-26  823  
02b4d17a9ac62b denglei     2021-04-26  824  	dbgtool_info = (struct dbgtool_k_glb_info *)
02b4d17a9ac62b denglei     2021-04-26  825  			kzalloc(sizeof(struct dbgtool_k_glb_info), GFP_KERNEL);
02b4d17a9ac62b denglei     2021-04-26  826  	if (!dbgtool_info) {
02b4d17a9ac62b denglei     2021-04-26  827  		pr_err("Failed to allocate dbgtool_info\n");
02b4d17a9ac62b denglei     2021-04-26  828  		ret = -EFAULT;
02b4d17a9ac62b denglei     2021-04-26  829  		goto dbgtool_info_fail;
02b4d17a9ac62b denglei     2021-04-26  830  	}
02b4d17a9ac62b denglei     2021-04-26  831  	chip_info->dbgtool_info = dbgtool_info;
02b4d17a9ac62b denglei     2021-04-26  832  
02b4d17a9ac62b denglei     2021-04-26  833  	/* FFM init */
02b4d17a9ac62b denglei     2021-04-26  834  	dbgtool_info->ffm = (struct ffm_record_info *)
02b4d17a9ac62b denglei     2021-04-26  835  				kzalloc(sizeof(struct ffm_record_info),
02b4d17a9ac62b denglei     2021-04-26  836  					GFP_KERNEL);
02b4d17a9ac62b denglei     2021-04-26  837  	if (!dbgtool_info->ffm) {
02b4d17a9ac62b denglei     2021-04-26  838  		pr_err("Failed to allocate cell contexts for a chain\n");
02b4d17a9ac62b denglei     2021-04-26  839  		ret = -EFAULT;
02b4d17a9ac62b denglei     2021-04-26  840  		goto dbgtool_info_ffm_fail;
02b4d17a9ac62b denglei     2021-04-26  841  	}
02b4d17a9ac62b denglei     2021-04-26  842  
02b4d17a9ac62b denglei     2021-04-26  843  	sema_init(&dbgtool_info->dbgtool_sem, 1);
02b4d17a9ac62b denglei     2021-04-26  844  
02b4d17a9ac62b denglei     2021-04-26  845  	ret = sscanf(chip_info->chip_name, HIFC_CHIP_NAME "%d", &id);
02b4d17a9ac62b denglei     2021-04-26  846  	if (ret < 0) {

sscanf() never returns negatives.  This needs to be:

	if (sscanf(chip_info->chip_name, HIFC_CHIP_NAME "%d", &id) != 1) {
		ret = -EINVAL;
		...

02b4d17a9ac62b denglei     2021-04-26  847  		pr_err("Failed to get hifc id\n");
02b4d17a9ac62b denglei     2021-04-26  848  		goto sscanf_chdev_fail;
02b4d17a9ac62b denglei     2021-04-26  849  	}
02b4d17a9ac62b denglei     2021-04-26  850  
02b4d17a9ac62b denglei     2021-04-26 @851  	g_card_node_array[id] = chip_info;
02b4d17a9ac62b denglei     2021-04-26  852  	chip_info->func_num++;
02b4d17a9ac62b denglei     2021-04-26  853  
02b4d17a9ac62b denglei     2021-04-26  854  	if (g_dbgtool_init_flag) {
02b4d17a9ac62b denglei     2021-04-26  855  		g_dbgtool_ref_cnt++;
02b4d17a9ac62b denglei     2021-04-26  856  		/* already initialized */
02b4d17a9ac62b denglei     2021-04-26  857  		return 0;
02b4d17a9ac62b denglei     2021-04-26  858  	}
02b4d17a9ac62b denglei     2021-04-26  859  
02b4d17a9ac62b denglei     2021-04-26  860  	ret = dbgtool_create_cdev();
02b4d17a9ac62b denglei     2021-04-26  861  	if (ret)
02b4d17a9ac62b denglei     2021-04-26  862  		goto alloc_chdev_fail;
02b4d17a9ac62b denglei     2021-04-26  863  
02b4d17a9ac62b denglei     2021-04-26  864  	g_dbgtool_init_flag = 1;
02b4d17a9ac62b denglei     2021-04-26  865  	g_dbgtool_ref_cnt = 1;
3d776c92130b1c zhoujiadong 2023-05-09  866  	mutex_init(&g_hifc_addr_lock);
02b4d17a9ac62b denglei     2021-04-26  867  
02b4d17a9ac62b denglei     2021-04-26  868  	return 0;
02b4d17a9ac62b denglei     2021-04-26  869  
02b4d17a9ac62b denglei     2021-04-26  870  alloc_chdev_fail:
02b4d17a9ac62b denglei     2021-04-26  871  	g_card_node_array[id] = NULL;
02b4d17a9ac62b denglei     2021-04-26  872  sscanf_chdev_fail:
02b4d17a9ac62b denglei     2021-04-26  873  	kfree(dbgtool_info->ffm);
02b4d17a9ac62b denglei     2021-04-26  874  dbgtool_info_ffm_fail:
02b4d17a9ac62b denglei     2021-04-26  875  	kfree(dbgtool_info);
02b4d17a9ac62b denglei     2021-04-26  876  	dbgtool_info = NULL;
02b4d17a9ac62b denglei     2021-04-26  877  	chip_info->dbgtool_info = NULL;
02b4d17a9ac62b denglei     2021-04-26  878  dbgtool_info_fail:
02b4d17a9ac62b denglei     2021-04-26  879  	hifc_comm_recv_up_self_cmd_unreg(hwdev, HIFC_SELF_CMD_UP2PF_FFM);
02b4d17a9ac62b denglei     2021-04-26  880  	chip_info->func_handle_array[hifc_global_func_id(hwdev)] = NULL;
02b4d17a9ac62b denglei     2021-04-26  881  	sysfs_remove_file(&((struct device *)(hwdev->dev_hdl))->kobj,
02b4d17a9ac62b denglei     2021-04-26  882  			  &chip_info->dbgtool_attr_file);
02b4d17a9ac62b denglei     2021-04-26 @883  	return ret;
02b4d17a9ac62b denglei     2021-04-26  884  }
02b4d17a9ac62b denglei     2021-04-26  885  
02b4d17a9ac62b denglei     2021-04-26  886  /**
3d776c92130b1c zhoujiadong 2023-05-09  887   * hifc_dbgtool_knl_deinit - dbgtool character device deinit
02b4d17a9ac62b denglei     2021-04-26  888   * @hwdev: the pointer to hardware device
02b4d17a9ac62b denglei     2021-04-26  889   * @chip_node: the pointer to card node
02b4d17a9ac62b denglei     2021-04-26  890   */
3d776c92130b1c zhoujiadong 2023-05-09  891  void hifc_dbgtool_knl_deinit(void *vhwdev, void *chip_node)
02b4d17a9ac62b denglei     2021-04-26  892  {
02b4d17a9ac62b denglei     2021-04-26  893  	struct dbgtool_k_glb_info *dbgtool_info;
02b4d17a9ac62b denglei     2021-04-26  894  	struct card_node *chip_info = (struct card_node *)chip_node;
02b4d17a9ac62b denglei     2021-04-26  895  	int id;
02b4d17a9ac62b denglei     2021-04-26  896  	int err;
02b4d17a9ac62b denglei     2021-04-26  897  	struct hifc_hwdev *hwdev = vhwdev;
02b4d17a9ac62b denglei     2021-04-26  898  
02b4d17a9ac62b denglei     2021-04-26  899  	if (hifc_func_type(hwdev) == TYPE_VF)
02b4d17a9ac62b denglei     2021-04-26  900  		return;
02b4d17a9ac62b denglei     2021-04-26  901  
02b4d17a9ac62b denglei     2021-04-26  902  	hifc_comm_recv_up_self_cmd_unreg(hwdev, HIFC_SELF_CMD_UP2PF_FFM);
02b4d17a9ac62b denglei     2021-04-26  903  
02b4d17a9ac62b denglei     2021-04-26  904  	chip_info->func_handle_array[hifc_global_func_id(hwdev)] = NULL;
02b4d17a9ac62b denglei     2021-04-26  905  
02b4d17a9ac62b denglei     2021-04-26  906  	sysfs_remove_file(&((struct device *)(hwdev->dev_hdl))->kobj,
02b4d17a9ac62b denglei     2021-04-26  907  			  &chip_info->dbgtool_attr_file);
02b4d17a9ac62b denglei     2021-04-26  908  
02b4d17a9ac62b denglei     2021-04-26  909  	chip_info->func_num--;
02b4d17a9ac62b denglei     2021-04-26  910  	if (chip_info->func_num)
02b4d17a9ac62b denglei     2021-04-26  911  		return;
02b4d17a9ac62b denglei     2021-04-26  912  
02b4d17a9ac62b denglei     2021-04-26  913  	err = sscanf(chip_info->chip_name, HIFC_CHIP_NAME "%d", &id);
02b4d17a9ac62b denglei     2021-04-26  914  	if (err < 0)
02b4d17a9ac62b denglei     2021-04-26  915  		pr_err("Failed to get hifc id\n");

Same.  Although there is no error handling here.

02b4d17a9ac62b denglei     2021-04-26  916  
02b4d17a9ac62b denglei     2021-04-26 @917  	g_card_node_array[id] = NULL;
02b4d17a9ac62b denglei     2021-04-26  918  
02b4d17a9ac62b denglei     2021-04-26  919  	dbgtool_info = chip_info->dbgtool_info;
02b4d17a9ac62b denglei     2021-04-26  920  	/* FFM deinit */
02b4d17a9ac62b denglei     2021-04-26  921  	kfree(dbgtool_info->ffm);
02b4d17a9ac62b denglei     2021-04-26  922  	dbgtool_info->ffm = NULL;
02b4d17a9ac62b denglei     2021-04-26  923  
02b4d17a9ac62b denglei     2021-04-26  924  	kfree(dbgtool_info);
02b4d17a9ac62b denglei     2021-04-26  925  	chip_info->dbgtool_info = NULL;
02b4d17a9ac62b denglei     2021-04-26  926  
3d776c92130b1c zhoujiadong 2023-05-09  927  	(void)hifc_dbgtool_knl_free_mem(id);
02b4d17a9ac62b denglei     2021-04-26  928  
02b4d17a9ac62b denglei     2021-04-26  929  	if (g_dbgtool_init_flag) {
02b4d17a9ac62b denglei     2021-04-26  930  		if ((--g_dbgtool_ref_cnt))
02b4d17a9ac62b denglei     2021-04-26  931  			return;
02b4d17a9ac62b denglei     2021-04-26  932  	}
02b4d17a9ac62b denglei     2021-04-26  933  
02b4d17a9ac62b denglei     2021-04-26  934  	if (!dbgtool_d_class)
02b4d17a9ac62b denglei     2021-04-26  935  		return;
02b4d17a9ac62b denglei     2021-04-26  936  
02b4d17a9ac62b denglei     2021-04-26  937  	device_destroy(dbgtool_d_class, dbgtool_dev_id);
02b4d17a9ac62b denglei     2021-04-26  938  	class_destroy(dbgtool_d_class);
02b4d17a9ac62b denglei     2021-04-26  939  	dbgtool_d_class = NULL;
02b4d17a9ac62b denglei     2021-04-26  940  
02b4d17a9ac62b denglei     2021-04-26  941  	cdev_del(&(dbgtool_chr_dev));
02b4d17a9ac62b denglei     2021-04-26  942  	unregister_chrdev_region(dbgtool_dev_id, 1);
02b4d17a9ac62b denglei     2021-04-26  943  
02b4d17a9ac62b denglei     2021-04-26  944  	g_dbgtool_init_flag = 0;
02b4d17a9ac62b denglei     2021-04-26  945  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

