Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFB719CCFC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732175325; cv=none; b=UTOA0UMDzX5PE0MuVSy73AUyA2PrRT5vfGQD4xgdE1ezKYf3mQpJZQcENEHqdfmikXool2C1MWRCYQeT+tS35FddINeGs/sNOZnKIA5LRxEG/At817oUXtmpQZKlWFcbCy0e55cJ6vv37lWCXgSwPatG/T0FINprVtz6FEED5Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732175325; c=relaxed/simple;
	bh=UJg6Fc6yfE1WR42NQXOEfzGx6WbpeIsPI3AQeH+6+3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUHthSyesKVUXZLdFERWUm3705VHVlpTNXLZVCvGQmeCkzr0Ef15aiDZTUFDjhpoEJ4ZunB9vgAmOi52hIQV3oKM7kEl3DFlPmw2lxaMHP2rhPZzcRMCGtBflkprCiQGVeqzxWXGk4o0kaynYitllhggj/8chVWvGV3tbPwXOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XvwmU32c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XvwmU32c"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so5026195e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 23:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732175321; x=1732780121; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MalJCbrlM5KjELA+1Wz0UdmbnMEPp5QVnyUOfkEE8KE=;
        b=XvwmU32cxEzuBm6JLSWp3YqVhgnsyTPPh4mBU7h9hMebC7Nog3yniQ4Zzb5WSWnaFl
         E54K196yrPp7N1cDkA7eJ1np3/rXr8H5idNTGEBprSYCiUXTyOYDhTB1hil1/R/NdieT
         bT9ETypoMRkdf7FLK7PJqS2kP3O0AYdDLQBt8+qD4I37BFbUw6m5NtZlaIVIUqNvEs4U
         LS1iboeKB/luT1YWI3NeF7HN+yeQKIYu7FyHRqiAR8BIFq3ET1b1vMWI7qpbyIBJPvzA
         T4Lk928tIwyXSYgt02hPHhR4cURe7Rxm28b59hvQvwo3awhLPZ2nmPpGE8X484D8/mlE
         SURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732175321; x=1732780121;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MalJCbrlM5KjELA+1Wz0UdmbnMEPp5QVnyUOfkEE8KE=;
        b=qSNgX0AQaF/plYgulJ7bHZd4m17zzWwYx6KJo5Ee1ULB15JsxhVsVC1EdPxmjv5zPw
         Q3gUCCJsygp8hxyNgjzlsVCXmrjGicsw+X0wKYz7i2Z3+/Mb5PBf18wgHuaERxxJ7gsv
         tt1jbl3Cr21bgVMpvngC36hhLgtEJTEBuub9H4YLKv+zS7AA5HXs8oIeICXTHV9lQzv0
         qHGHpzMB/4ku/GhGt6jEIl/lWz5lTIx9mtCjVDro3bcyENhupYyJm5FlYmDUi3HWmAfp
         wNd4CtupfH6+7LxmmSgF0bxaheexbe4PreUKkrFFV/a4ou8wNCVYzCWjhaZ17ulTh04w
         XhJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2sw62S9UTyCIbdQehlLyOXmW8q+vHTPgkVt1WnAZyTG9ZjSbg1C2rP2EedtW3zUvBFxgk+LTGoMF/dWjf@lists.linux.dev
X-Gm-Message-State: AOJu0YwkZtJTP4oJRRY8hXkvwr/ryF6UASmKm1okYoBPwS0j/hM4UTtL
	+QlJ2uKFZOaB/vZDgDq/teSdbdn7hgGI20edv0/gAhilAZBC8Gip/NWdu7flS1E=
X-Gm-Gg: ASbGncupaL70yFkupUQLS5ac8MbYkhM6PUxMCU4gGwXgiwbFnLkhTTp9YbPLQlhGP8c
	xlBoJPCnEwiRTizefVAJ/rXqo+b3ptpa9kE3nSk9W9Li0LYn7u0djj3x1E9DylXIb9MbrFlgUiM
	KTufcOQEH6ypuotFoCb1l6ju6bXqkR1D2QKTk2nqhAZPck1SS5yJeuawaak9/iOdO7om411LNhz
	tsbPFpt68OJLpKCrRVA355qw2Jap19Yq1Ej+k0qbEO3nSPl7lYUP+I=
X-Google-Smtp-Source: AGHT+IEcrxzvSws6mwkNoqetpdWn5SoVYGO+KDxTimkVdVIQJLPse4J6WQYKC+eFvFJw9w0jbfcjqQ==
X-Received: by 2002:a05:6000:2a2:b0:382:4fad:3b43 with SMTP id ffacd0b85a97d-38254b24ce1mr4287215f8f.48.1732175321524;
        Wed, 20 Nov 2024 23:48:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825494b974sm4065071f8f.108.2024.11.20.23.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 23:48:41 -0800 (PST)
Date: Thu, 21 Nov 2024 10:48:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: [linux-next:master 9320/12380]
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2499
 iwl_mvm_parse_wowlan_info_notif() warn: variable dereferenced before check
 'data' (see line 2497)
Message-ID: <b422d3db-9812-4672-ae7b-ec79e0004488@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac24e26aa08fe026804f678599f805eb13374a5d
commit: 4635e6eaa0fec321409242f99cccedbaf486c5e8 [9320/12380] wifi: iwlwifi: mvm: support new versions of the wowlan APIs
config: i386-randconfig-141-20241120 (https://download.01.org/0day-ci/archive/20241121/202411210812.0eLaonw3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411210812.0eLaonw3-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2499 iwl_mvm_parse_wowlan_info_notif() warn: variable dereferenced before check 'data' (see line 2497)

vim +/data +2499 drivers/net/wireless/intel/iwlwifi/mvm/d3.c

32fed4706d9aca Naftali Goldstein 2022-09-06  2491  static void iwl_mvm_parse_wowlan_info_notif(struct iwl_mvm *mvm,
32fed4706d9aca Naftali Goldstein 2022-09-06  2492  					    struct iwl_wowlan_info_notif *data,
32fed4706d9aca Naftali Goldstein 2022-09-06  2493  					    struct iwl_wowlan_status_data *status,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2494  					    u32 len)
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2495  {
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2496  	u32 expected_len = sizeof(*data) +
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28 @2497  		data->num_mlo_link_keys * sizeof(status->mlo_keys[0]);
                                                                ^^^^^^
Dereference

Btw, this seems like an opportunity for struct_size() although you'd need to
change the type to size_t:

	size_t expected_len = struct_size(data, mlo_gtks, data->num_mlo_link_keys);

4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2498  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28 @2499  	if (!data) {
                                                             ^^^^
Checked too late.

4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2500  		IWL_ERR(mvm, "iwl_wowlan_info_notif data is NULL\n");
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2501  		status = NULL;
                                                                ^^^^^^^^^^^^^
This assignment is a no-op.  The compiler will probably remove it I think.
And Colin King will also remove it eventually.  ;)

4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2502  		return;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2503  	}
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2504  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2505  	if (len < expected_len) {
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2506  		IWL_ERR(mvm, "Invalid WoWLAN info notification!\n");
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2507  		status = NULL;

Same.

4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2508  		return;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2509  	}
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2510  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2511  	if (mvm->fast_resume)
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2512  		return;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2513  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2514  	iwl_mvm_convert_key_counters_v5(status, &data->gtk[0].sc);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2515  	iwl_mvm_convert_gtk_v3(status, data->gtk);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2516  	iwl_mvm_convert_igtk(status, &data->igtk[0]);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2517  	iwl_mvm_convert_bigtk(status, data->bigtk);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2518  	status->replay_ctr = le64_to_cpu(data->replay_ctr);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2519  	status->pattern_number = le16_to_cpu(data->pattern_number);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2520  	status->tid_offloaded_tx = data->tid_offloaded_tx;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2521  	if (IWL_FW_CHECK(mvm,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2522  			 data->tid_offloaded_tx >=
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2523  			 ARRAY_SIZE(status->qos_seq_ctr),
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2524  			 "tid_offloaded_tx is out of bound %d\n",
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2525  			 data->tid_offloaded_tx))
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2526  		data->tid_offloaded_tx = 0;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2527  	status->qos_seq_ctr[data->tid_offloaded_tx] =
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2528  		le16_to_cpu(data->qos_seq_ctr);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2529  	status->wakeup_reasons = le32_to_cpu(data->wakeup_reasons);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2530  	status->num_of_gtk_rekeys =
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2531  		le32_to_cpu(data->num_of_gtk_rekeys);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2532  	status->received_beacons = le32_to_cpu(data->received_beacons);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2533  	status->tid_tear_down = data->tid_tear_down;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2534  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2535  	if (data->num_mlo_link_keys) {
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2536  		status->num_mlo_keys = data->num_mlo_link_keys;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2537  		if (IWL_FW_CHECK(mvm,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2538  				 status->num_mlo_keys > WOWLAN_MAX_MLO_KEYS,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2539  				 "Too many mlo keys: %d, max %d\n",
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2540  				 status->num_mlo_keys, WOWLAN_MAX_MLO_KEYS))
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2541  			status->num_mlo_keys = WOWLAN_MAX_MLO_KEYS;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2542  		memcpy(status->mlo_keys, data->mlo_gtks,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2543  		       status->num_mlo_keys * sizeof(status->mlo_keys[0]));
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2544  	}
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2545  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

