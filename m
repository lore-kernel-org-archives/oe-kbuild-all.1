Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EC04C85
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740985809; cv=none; b=qqzZTmnVlrgi8RDuC0oinsS5IkxktwhRGw+oPY//kvv/RqbIi0TZrl1jpBCTQgrPPy4+usR/ohiKL5s3Eh1DVMZ3F18M3JFno1X468jxlA7FH8+p6PaFQZPxO+Bxo3jYiPk2JGqcmAO1cky0rkL2P8MxA+earcfRa635Z8VLfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740985809; c=relaxed/simple;
	bh=W2Vj39751Bhjtkz/CVuLaVLdqFoOBBQpqm1/ISMyOt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ATjaSYiSzwrdJp0015PMKd8S+Hv9xUyXfWCOlVgNiygE+OoYuC00o52gZXTD9xq5aZ5ManjX6RwALzAFM0XilWZgEsLQltB3c1BxqRN33N5I3tMagj0xn45ZNZ8y9QX2mi/8jbpwow23N4nl3TzdHtMIXg//TqO6B+8DBPaGMeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWw3z+wz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWw3z+wz"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abf64aa2a80so218228866b.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Mar 2025 23:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740985805; x=1741590605; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fpWKkfL+fl8msV0fvERh8Rvd4rH1OW4GUOLjUnGu4fw=;
        b=DWw3z+wzG6C54NUPvkfJo05LLDFQgvEir+fiOMor7R3ybfa9c0YCCJEe8sHaCvRN1a
         BkTJmxbto+Eyu7rIStkUp0G4g8B+t9pcnYg2dKI//jv8ZM4nVGqYHjQejj4Eha0qrgAs
         lXc7ZuUi8AJfbjsYr9TMAcaAU5+YR+LjoFcATT7lBm+q+j4tEqoZjvfinaY29dC+udJg
         wzO6lKuePVeLlAfNbQ0HWbeHJsrkYk1LIye8IdzzpZkJME6FLPw8FsCVirJSzmsln0CB
         mZDSuOOTzzSW1JPpp4XkzX4gwOfogzRVFOMC+8MlzhX2YuBb19lkruU80LLcSVoelBuF
         /x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740985805; x=1741590605;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpWKkfL+fl8msV0fvERh8Rvd4rH1OW4GUOLjUnGu4fw=;
        b=w3Dhdrnx7blq9Bbf/oQ/bveL5PkKI3gQnHrOqzSt3uKAkIHlnCRwNrYu6Vw4ZGF5nn
         isycoUJPICGAdKR6uc2SxSByW/7qM0t5XbZhP5V6428YDINRkGKdqvxl1b0ewWicFp/+
         /uS1M5V7CJkr3tvNF6Pc5FeOZ7ErKr03rMulqrGxohEQ6dwfVXzn0KzKXpKU4mFV9aSY
         CpNBZDFcIhuRPrLkDmuHRqg+7QqNYwflfpd1ASV7DvnpplfF+BXQ3hmbfk90o8hoklrW
         a6Vfgi3I+xC6rzoaod2nyQ/aRdr2SsBUmt3/gOzKF7ANOhNbo6pQrqkauCXx2p8FFIoz
         gaaw==
X-Forwarded-Encrypted: i=1; AJvYcCUhOGgnLCWu10BTFFLYdILR2XKG1odWb85OT0RvEhrH/erOIOfgg6GVHuso+UKSJqu9P7cn7y93FzQn8Y0P@lists.linux.dev
X-Gm-Message-State: AOJu0Yx36bV01V2YnXkG1Hubxlhf1/rOlXXDksS0YPVL+W8fibbRRggI
	fALvus4fLNlXrM5jO78TBQsr6MhO9TAXfNtriu69RWCb6BNbp1FQYxXkHLHjcPIr5oW0Yk18PIw
	h
X-Gm-Gg: ASbGncsJ+9e/oArH3BgIYBWwEukhtuDLOMbRIlgdzA02u222ZBt2hND4v5Zc6bSd+tI
	dC1tkRoikllsM7nWJXhQlP97lz+sNllJ4iO8kxPXh/lKZ2Jqs+F6tiH4k4aZvv9XGZK4myn+zkV
	aU66b2rBslLpYjeBbwcnCN1+ppp214jhnuyi75AL154An4qLiCQGMHqdiKEXJE9eIRR/7l7S340
	Cx4F3lZbUoQTqsVYKA6hkLu+DauoimjqKttwEyeQtuWTZtX3fbDyo54039phdRbEGXvZNzd0Rd+
	q4XaRxKPcuz6NFj4L9pvBITqV/lWoQgmPo8Ip04yFb4LOdidJg==
X-Google-Smtp-Source: AGHT+IGu7WB+BBuNdB0Gl8etcZ8tx1a35hIS/Ur49IC/bSwNk6QJEaciA0rEzNztLVjNeIARFIoN0Q==
X-Received: by 2002:a17:907:7ea5:b0:ab8:c215:fd27 with SMTP id a640c23a62f3a-abf25fa8e4fmr1344109066b.14.1740985804710;
        Sun, 02 Mar 2025 23:10:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac104bbbd2csm93483366b.175.2025.03.02.23.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 23:10:04 -0800 (PST)
Date: Mon, 3 Mar 2025 10:10:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kiran K <kiran.k@intel.com>,
	linux-bluetooth@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
	chandrashekar.devegowda@intel.com, vijay.satija@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: Re: [PATCH v1] Bluetooth: btintel_pcie: Add support for device
 coredump
Message-ID: <d61fe144-b47c-4e60-a95e-26522792dd50@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227102625.20642-1-kiran.k@intel.com>

Hi Kiran,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiran-K/Bluetooth-btintel_pcie-Add-support-for-device-coredump/20250227-181131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20250227102625.20642-1-kiran.k%40intel.com
patch subject: [PATCH v1] Bluetooth: btintel_pcie: Add support for device coredump
config: sparc-randconfig-r071-20250302 (https://download.01.org/0day-ci/archive/20250302/202503022332.biRVCDMP-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503022332.biRVCDMP-lkp@intel.com/

New smatch warnings:
drivers/bluetooth/btintel_pcie.c:493 btintel_pcie_read_dram_buffers() error: snprintf() is printing too much 100 vs 70

vim +493 drivers/bluetooth/btintel_pcie.c

b8cc1a1cce30cc Kiran K 2025-02-27  454  static int btintel_pcie_read_dram_buffers(struct btintel_pcie_data *data)
b8cc1a1cce30cc Kiran K 2025-02-27  455  {
b8cc1a1cce30cc Kiran K 2025-02-27  456  	u32 offset, prev_size, wr_ptr_status, dump_size, i;
b8cc1a1cce30cc Kiran K 2025-02-27  457  	struct btintel_pcie_dbgc *dbgc = &data->dbgc;
b8cc1a1cce30cc Kiran K 2025-02-27  458  	u8 buf_idx, dump_time_len, fw_build;
b8cc1a1cce30cc Kiran K 2025-02-27  459  	struct hci_dev *hdev = data->hdev;
b8cc1a1cce30cc Kiran K 2025-02-27  460  	struct intel_tlv *tlv;
b8cc1a1cce30cc Kiran K 2025-02-27  461  	struct timespec64 now;
b8cc1a1cce30cc Kiran K 2025-02-27  462  	struct sk_buff *skb;
b8cc1a1cce30cc Kiran K 2025-02-27  463  	struct tm tm_now;
b8cc1a1cce30cc Kiran K 2025-02-27  464  	char buf[100];
b8cc1a1cce30cc Kiran K 2025-02-27  465  	u16 hdr_len;
b8cc1a1cce30cc Kiran K 2025-02-27  466  	int ret;
b8cc1a1cce30cc Kiran K 2025-02-27  467  
b8cc1a1cce30cc Kiran K 2025-02-27  468  	wr_ptr_status = btintel_pcie_rd_dev_mem(data, BTINTEL_PCIE_DBGC_CUR_DBGBUFF_STATUS);
b8cc1a1cce30cc Kiran K 2025-02-27  469  	offset = wr_ptr_status & BTINTEL_PCIE_DBG_OFFSET_BIT_MASK;
b8cc1a1cce30cc Kiran K 2025-02-27  470  
b8cc1a1cce30cc Kiran K 2025-02-27  471  	buf_idx = BTINTEL_PCIE_DBGC_DBG_BUF_IDX(wr_ptr_status);
b8cc1a1cce30cc Kiran K 2025-02-27  472  	if (buf_idx > dbgc->count) {
b8cc1a1cce30cc Kiran K 2025-02-27  473  		bt_dev_warn(hdev, "Buffer index is invalid");
b8cc1a1cce30cc Kiran K 2025-02-27  474  		return -EINVAL;
b8cc1a1cce30cc Kiran K 2025-02-27  475  	}
b8cc1a1cce30cc Kiran K 2025-02-27  476  
b8cc1a1cce30cc Kiran K 2025-02-27  477  	prev_size = buf_idx * BTINTEL_PCIE_DBGC_BUFFER_SIZE;
b8cc1a1cce30cc Kiran K 2025-02-27  478  	if (prev_size + offset >= prev_size)
b8cc1a1cce30cc Kiran K 2025-02-27  479  		data->dmp_hdr.write_ptr = prev_size + offset;
b8cc1a1cce30cc Kiran K 2025-02-27  480  	else
b8cc1a1cce30cc Kiran K 2025-02-27  481  		return -EINVAL;
b8cc1a1cce30cc Kiran K 2025-02-27  482  
b8cc1a1cce30cc Kiran K 2025-02-27  483  	ktime_get_real_ts64(&now);
b8cc1a1cce30cc Kiran K 2025-02-27  484  	time64_to_tm(now.tv_sec, 0, &tm_now);
b8cc1a1cce30cc Kiran K 2025-02-27  485  	dump_time_len = snprintf(buf, sizeof(buf), "Dump Time: %02d-%02d-%04ld %02d:%02d:%02d",
b8cc1a1cce30cc Kiran K 2025-02-27  486  				 tm_now.tm_mday, tm_now.tm_mon + 1, tm_now.tm_year + 1900,
b8cc1a1cce30cc Kiran K 2025-02-27  487  				 tm_now.tm_hour, tm_now.tm_min, tm_now.tm_sec);
b8cc1a1cce30cc Kiran K 2025-02-27  488  
b8cc1a1cce30cc Kiran K 2025-02-27  489  	fw_build = snprintf(buf + dump_time_len, sizeof(buf),
                                                                                         ^^^^^^^^^^^

This size should be "sizeof(buf) - dump_time_len".  It's better to
use scnprintf() here vs snprintf().  The scnprintf() function returns
the number of bytes which were actually printed vs the number which
were printed if there was enough space.

b8cc1a1cce30cc Kiran K 2025-02-27  490  			    "Firmware Timestamp: Year %u WW %02u buildtype %u build %u",
b8cc1a1cce30cc Kiran K 2025-02-27  491  			    2000 + (data->dmp_hdr.fw_timestamp >> 8),
b8cc1a1cce30cc Kiran K 2025-02-27  492  			    data->dmp_hdr.fw_timestamp & 0xff, data->dmp_hdr.fw_build_type,
b8cc1a1cce30cc Kiran K 2025-02-27 @493  			    data->dmp_hdr.fw_build_num);
b8cc1a1cce30cc Kiran K 2025-02-27  494  
b8cc1a1cce30cc Kiran K 2025-02-27  495  	hdr_len = sizeof(*tlv) + sizeof(data->dmp_hdr.cnvi_bt) +
b8cc1a1cce30cc Kiran K 2025-02-27  496  		  sizeof(*tlv) + sizeof(data->dmp_hdr.write_ptr) +
b8cc1a1cce30cc Kiran K 2025-02-27  497  		  sizeof(*tlv) + sizeof(data->dmp_hdr.wrap_ctr) +
b8cc1a1cce30cc Kiran K 2025-02-27  498  		  sizeof(*tlv) + sizeof(data->dmp_hdr.trigger_reason) +
b8cc1a1cce30cc Kiran K 2025-02-27  499  		  sizeof(*tlv) + sizeof(data->dmp_hdr.fw_git_sha1) +
b8cc1a1cce30cc Kiran K 2025-02-27  500  		  sizeof(*tlv) + sizeof(data->dmp_hdr.cnvr_top) +
b8cc1a1cce30cc Kiran K 2025-02-27  501  		  sizeof(*tlv) + sizeof(data->dmp_hdr.cnvi_top) +
b8cc1a1cce30cc Kiran K 2025-02-27  502  		  sizeof(*tlv) + dump_time_len +
b8cc1a1cce30cc Kiran K 2025-02-27  503  		  sizeof(*tlv) + fw_build;
b8cc1a1cce30cc Kiran K 2025-02-27  504  
b8cc1a1cce30cc Kiran K 2025-02-27  505  	dump_size = hdr_len + sizeof(hdr_len);
b8cc1a1cce30cc Kiran K 2025-02-27  506  
b8cc1a1cce30cc Kiran K 2025-02-27  507  	skb = alloc_skb(dump_size, GFP_KERNEL);
b8cc1a1cce30cc Kiran K 2025-02-27  508  	if (!skb)
b8cc1a1cce30cc Kiran K 2025-02-27  509  		return -ENOMEM;
b8cc1a1cce30cc Kiran K 2025-02-27  510  
b8cc1a1cce30cc Kiran K 2025-02-27  511  	/* Add debug buffers data length to dump size */
b8cc1a1cce30cc Kiran K 2025-02-27  512  	dump_size += BTINTEL_PCIE_DBGC_BUFFER_SIZE * dbgc->count;
b8cc1a1cce30cc Kiran K 2025-02-27  513  
b8cc1a1cce30cc Kiran K 2025-02-27  514  	ret = hci_devcd_init(hdev, dump_size);
b8cc1a1cce30cc Kiran K 2025-02-27  515  	if (ret) {
b8cc1a1cce30cc Kiran K 2025-02-27  516  		bt_dev_err(hdev, "Failed to init devcoredump, err %d", ret);
b8cc1a1cce30cc Kiran K 2025-02-27  517  		kfree_skb(skb);
b8cc1a1cce30cc Kiran K 2025-02-27  518  		return ret;
b8cc1a1cce30cc Kiran K 2025-02-27  519  	}
b8cc1a1cce30cc Kiran K 2025-02-27  520  
b8cc1a1cce30cc Kiran K 2025-02-27  521  	skb_put_data(skb, &hdr_len, sizeof(hdr_len));
b8cc1a1cce30cc Kiran K 2025-02-27  522  
b8cc1a1cce30cc Kiran K 2025-02-27  523  	btintel_pcie_copy_tlv(skb, BTINTEL_CNVI_BT, &data->dmp_hdr.cnvi_bt,
b8cc1a1cce30cc Kiran K 2025-02-27  524  			      sizeof(data->dmp_hdr.cnvi_bt));
b8cc1a1cce30cc Kiran K 2025-02-27  525  
b8cc1a1cce30cc Kiran K 2025-02-27  526  	btintel_pcie_copy_tlv(skb, BTINTEL_WRITE_PTR, &data->dmp_hdr.write_ptr,
b8cc1a1cce30cc Kiran K 2025-02-27  527  			      sizeof(data->dmp_hdr.write_ptr));
b8cc1a1cce30cc Kiran K 2025-02-27  528  
b8cc1a1cce30cc Kiran K 2025-02-27  529  	data->dmp_hdr.wrap_ctr = btintel_pcie_rd_dev_mem(data,
b8cc1a1cce30cc Kiran K 2025-02-27  530  							 BTINTEL_PCIE_DBGC_DBGBUFF_WRAP_ARND);
b8cc1a1cce30cc Kiran K 2025-02-27  531  
b8cc1a1cce30cc Kiran K 2025-02-27  532  	btintel_pcie_copy_tlv(skb, BTINTEL_WRAP_CTR, &data->dmp_hdr.wrap_ctr,
b8cc1a1cce30cc Kiran K 2025-02-27  533  			      sizeof(data->dmp_hdr.wrap_ctr));
b8cc1a1cce30cc Kiran K 2025-02-27  534  
b8cc1a1cce30cc Kiran K 2025-02-27  535  	btintel_pcie_copy_tlv(skb, BTINTEL_TRIGGER_REASON, &data->dmp_hdr.trigger_reason,
b8cc1a1cce30cc Kiran K 2025-02-27  536  			      sizeof(data->dmp_hdr.trigger_reason));
b8cc1a1cce30cc Kiran K 2025-02-27  537  
b8cc1a1cce30cc Kiran K 2025-02-27  538  	btintel_pcie_copy_tlv(skb, BTINTEL_FW_SHA, &data->dmp_hdr.fw_git_sha1,
b8cc1a1cce30cc Kiran K 2025-02-27  539  			      sizeof(data->dmp_hdr.fw_git_sha1));
b8cc1a1cce30cc Kiran K 2025-02-27  540  
b8cc1a1cce30cc Kiran K 2025-02-27  541  	btintel_pcie_copy_tlv(skb, BTINTEL_CNVR_TOP, &data->dmp_hdr.cnvr_top,
b8cc1a1cce30cc Kiran K 2025-02-27  542  			      sizeof(data->dmp_hdr.cnvr_top));
b8cc1a1cce30cc Kiran K 2025-02-27  543  
b8cc1a1cce30cc Kiran K 2025-02-27  544  	btintel_pcie_copy_tlv(skb, BTINTEL_CNVI_TOP, &data->dmp_hdr.cnvi_top,
b8cc1a1cce30cc Kiran K 2025-02-27  545  			      sizeof(data->dmp_hdr.cnvi_top));
b8cc1a1cce30cc Kiran K 2025-02-27  546  
b8cc1a1cce30cc Kiran K 2025-02-27  547  	btintel_pcie_copy_tlv(skb, BTINTEL_DUMP_TIME, buf, dump_time_len);
b8cc1a1cce30cc Kiran K 2025-02-27  548  
b8cc1a1cce30cc Kiran K 2025-02-27  549  	btintel_pcie_copy_tlv(skb, BTINTEL_FW_BUILD, buf + dump_time_len, fw_build);
b8cc1a1cce30cc Kiran K 2025-02-27  550  
b8cc1a1cce30cc Kiran K 2025-02-27  551  	ret = hci_devcd_append(hdev, skb);
b8cc1a1cce30cc Kiran K 2025-02-27  552  	if (ret)
b8cc1a1cce30cc Kiran K 2025-02-27  553  		goto exit_err;
b8cc1a1cce30cc Kiran K 2025-02-27  554  
b8cc1a1cce30cc Kiran K 2025-02-27  555  	for (i = 0; i < dbgc->count; i++) {
b8cc1a1cce30cc Kiran K 2025-02-27  556  		ret = btintel_pcie_add_dmp_data(hdev, dbgc->bufs[i].data,
b8cc1a1cce30cc Kiran K 2025-02-27  557  						BTINTEL_PCIE_DBGC_BUFFER_SIZE);
b8cc1a1cce30cc Kiran K 2025-02-27  558  		if (ret)
b8cc1a1cce30cc Kiran K 2025-02-27  559  			break;
b8cc1a1cce30cc Kiran K 2025-02-27  560  	}
b8cc1a1cce30cc Kiran K 2025-02-27  561  
b8cc1a1cce30cc Kiran K 2025-02-27  562  exit_err:
b8cc1a1cce30cc Kiran K 2025-02-27  563  	hci_devcd_complete(hdev);
b8cc1a1cce30cc Kiran K 2025-02-27  564  	return ret;
b8cc1a1cce30cc Kiran K 2025-02-27  565  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

