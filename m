Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867C38286F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727263163; cv=none; b=Su18q+LETeujYiE+cJL57eelrlWQTp9lK57K8HKKrq901QprpsIJDNo4hUa7ToCjb4nvrlAIrAeHak13JIXcaHV/06OR+d1MG4BN635yBIj07GhxPowmmrYK0Un+9DLSvc+d626OMpPbDlwVE0BmOokfw5jLwOF8TBZb7MSkQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727263163; c=relaxed/simple;
	bh=HYCLZsTqy5zf0vloXvRPm8m+7ps4FJa2z9CDElflmXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDpKgPB+KZ/WEBxgZxRGoQKyOIUYXBsO6KnKNpRny1xm2BmBgo7gRZqbyWcDX6cpzjhb9luK/bLOvIvK349h8fOoxDJraDOsSDAHy1KbjPhmYaPi8paxL+dkKsjqIvsVQ7Qk+QVMQzcj1WfkznwWQdDyUbyx9xXXuby9chTMmmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pCkIhqLb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pCkIhqLb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so84486645e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 04:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727263160; x=1727867960; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwrBVrrl9icLHzRivuAZDS1T409O3kkAvhE/0khG5+4=;
        b=pCkIhqLb0y8xV3IN3kXAb4fy887n5gd5O4aaa+/hwJKFGggihALANBr/I4pcK0nOS+
         9z8UtZDZ46aQQeWKCjlpUxXfY3ccaNZmmKkSpv1ZTT1fQ/P9NvjCncxTXWGW8kiLZHQd
         yEpHBQP2pY7YvtWlcHzC2p2X376ePtSQ0fsHGA3KCWF2ghasjEHDuoat75Zv+v29ovlV
         5bYvSfmAikPMgD+MSUgvQyDB0KDFkpJ79oPkID+9Zv4SU21B45FWo5JqnNOZkMgUYRa5
         Uibmr9Vuqk+6MPM/TXC/i1xVh1hFP+kHN8spQqVCx/SBWX8OZA8dy1PgzBKZrTw/X+5s
         BFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727263160; x=1727867960;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwrBVrrl9icLHzRivuAZDS1T409O3kkAvhE/0khG5+4=;
        b=o4qILmxRN1TXxppzrCpcRW6uuAx+x5G+/FzEY+dqJ68UP1IMawucjUM8hypndJsbgt
         IYv2+hCY/pispTESDho72I9RXx1B84ao+Y5UT9Kp47AnnoSD4aSpklpJJgwDHbK5/G9V
         m5Ngx8Ecsr3WQM/IVWj/+4PJpE+brdhOZ+41PC1/fnQzWLxT9X3vmQJ77JSK038Od7MM
         7JQUC9O1Nb28OoYiE25DWvDk5NDwd24wGUgkaLgoFh7VNmZbOHjnV9BDm74tc96tn1jA
         /tlVZzYpmohMcG2ZRQD1He1BRfcFIb/Ms7nUq1f7oYx8t7EkRq/wkI6thzBCwVF+ijiz
         YfnA==
X-Forwarded-Encrypted: i=1; AJvYcCWGyLzgZMvvoMnq04/8sRO3zLY7IO/8LO1e0hwOb97sZ07pnz9Sq6xHjl+nPvE/oiObhI/zBn70HFH2GXGk@lists.linux.dev
X-Gm-Message-State: AOJu0YzBAP8lWmbIxpC55iEUZ5rQgLo42Lr0HA/UEXCxoVzxZ+QWwlB/
	cXjEhwtpTmrXUpIMMGbq1wk61Ah6HA8OTPr8unFy5Z0uKeCanTxgr5EkqTVKY30=
X-Google-Smtp-Source: AGHT+IHB8K8UidI17kGEGb/MIhX+Sy1vHc9Twgbgv3+Sl3Q/hFmdzsr/NOcZ5Q2PSxDUG453URlY1g==
X-Received: by 2002:a5d:44c8:0:b0:37c:cc05:7a56 with SMTP id ffacd0b85a97d-37ccc057cacmr643035f8f.10.1727263159645;
        Wed, 25 Sep 2024 04:19:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ccbe23336sm525435f8f.62.2024.09.25.04.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:19:19 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:19:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Yingbao Jia <yingbao.jia@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 23318/30000]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100
 isst_if_get_tpmi_instance_count() warn: potential spectre issue
 'isst_common.sst_inst' [r] (local cap)
Message-ID: <57ac2ceb-93f9-42d6-a585-3f6bc00fa0f6@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ef5e9d0437237465f258a80a0d5d8e1e26872c7a
commit: 4dc4d762dd6ed4cb851209a87e79d7d936b3fb4c [23318/30000] platform/x86: ISST: Enumerate TPMI SST and create framework
config: x86_64-randconfig-161-20240925 (https://download.01.org/0day-ci/archive/20240925/202409250439.RGKHfbdX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409250439.RGKHfbdX-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:104 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +100 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c

4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   88  static int isst_if_get_tpmi_instance_count(void __user *argp)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   89  {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   90  	struct isst_tpmi_instance_count tpmi_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   91  	struct tpmi_sst_struct *sst_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   92  	int i;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   93  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   94  	if (copy_from_user(&tpmi_inst, argp, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   95  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   96  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   97  	if (tpmi_inst.socket_id >= topology_max_packages())
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   98  		return -EINVAL;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   99  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @100  	tpmi_inst.count = isst_common.sst_inst[tpmi_inst.socket_id]->number_of_power_domains;

I believe this is a case where we need to use array_index_nospec().  But you
work for Intel so I'm sure there are experts you could ask.  ;)  Let me know
either way so I can learn from this.

4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  101  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  102  	sst_inst = isst_common.sst_inst[tpmi_inst.socket_id];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  103  	tpmi_inst.valid_mask = 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @104  	for (i = 0; i < sst_inst->number_of_power_domains; ++i) {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  105  		struct tpmi_per_power_domain_info *power_domain_info;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  106  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  107  		power_domain_info = &sst_inst->power_domain_info[i];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  108  		if (power_domain_info->sst_base)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  109  			tpmi_inst.valid_mask |= BIT(i);
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  110  	}
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  111  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  112  	if (copy_to_user(argp, &tpmi_inst, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  113  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  114  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  115  	return 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  116  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

