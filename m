Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A29015855C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 17:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742664189; cv=none; b=hlvPnSxXoXYnNDl6VHMKdD9CtAi4DQJekT4aCttKCazjVzQEGL6g1grDbS5JqEk+6GkCXLcDkWWN1o4KV8u69FZ27wGonAUy4ZvAvjIiAfMwKIf+vLEBXQgi2v+lrx4dS4STixBY5pHPHJaWdRduJvOw8DqC00KZqt893/WSiBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742664189; c=relaxed/simple;
	bh=AlSQwxeFSvZ/eH6sNlsPVVY8Sc3bDvwMirQr0L2Rzlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NqdeVXvOfG+sskuOqdLU1osIKiTPdb1yaLIgL7y2qBHtlHnxnYJUuyJsVov+hwxWJ7X85ZDG6W3/C8x45SqlFgVRzGXq1dF06LMdXula9nJxn6PlGJCG9AwilU6pwbMQD2FenVsUHH5keZQ/5o+qRHBCK6eoE0i231F5RJIgUC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrLSQASb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrLSQASb"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0618746bso20250185e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742664186; x=1743268986; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KLBM96GK8Vo2bxF4XJ5k9cl07rF/cnDeLjPmLmQH8R8=;
        b=mrLSQASbxXVH2+pXAgs/NBdTRxl9S68OlljzdxkEZKFCw9Xd9OiBSQa5wS8yeQF+Yh
         Xoq4FRto1JEYyWd7kNkw7rAWDtWnVfwpicF/ahBXMIr9dN63URTneIlcsgSHElwx9fvc
         hM5MEdFCGGxYBQUeu6QajY32pZzLMqMpT0jiUAhvW4Ndj8m+XqZp2qmZ/DhTKD8+uYQ9
         6f9QfO+b5pnx/gKWnannpzGvekzLBDnbdVkB31vpW4kPrNlRuCI2lK+XDVnadKWFd4hP
         Kcw/HvjlvaTSy8qo6xtXTfrxwuJ1qI2fDPcdFbLhxo9YAXN+MCulPCpMPnLpXY+2Dzqi
         uI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742664186; x=1743268986;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KLBM96GK8Vo2bxF4XJ5k9cl07rF/cnDeLjPmLmQH8R8=;
        b=KS9dhmpJKi7qANlv0b79VaF0VXEIM2ZA2Wc9kBawuj/IWJy8GsIa6d8d3TSNITNV+y
         2DsN2tNtzqSA1XPtdmHo9IsiMoOVyCY9ibX+6129D9ZYDNPlMWHPbQIGfTSZAlp/7rkC
         3l2v7ZeTyVa9dkiGSvqVobePNlOU/SqEQZ9dakoQw4t6UDcCYKbQj62Lne4s48s0Qz3R
         YdIYTXe1qDZhpCF+Pi6l+eNrU+acMEm7W7OybuJnpz6tj2HuTSQScZBRUuHu+JJ/mPqy
         LLMpOmyEHv5IxQYtIDZccqJs15cduj5l2lHWZp+CFOkkfL1cTo5H00xIKy/Gx88lw5As
         wHKw==
X-Forwarded-Encrypted: i=1; AJvYcCVqSiCW5UmGckHmi1h26sAmMuNc0L4FgAew9gALCESV36UnA4dqVb+eLGzUIQCWtc9oCFXSd1n93/vJ5LzV@lists.linux.dev
X-Gm-Message-State: AOJu0YzwNpPc+dl1rNBFl2BUsJtkdYqp5UUnQ3HHvhPt7uurSBC+9qwn
	chNDcwcuyYDl/PpTg8gm/kIMUituK7qBXu5ecjcbUICBwj3Ia+Xe4Jazd9lGLYA=
X-Gm-Gg: ASbGncvqq2VhJFvo09Ua+PmSkg3JX7Amp007DRVjz7IQfvKzx8FOrvdKirnMm4IwbF6
	d+1dSr2/Jsv2fW2cHDwZIzNtzL5HiXHJL9ZEQEC2t5FVhs6oJZqZT3r8sVZMS+j9glvcuDdxhRI
	T7D64CO2uFl2AKXZgbaTMIqXD2ueCs5XMvctsndjky+5c8b7asRlCFAuUg+oCHp2nWw5zVwINoc
	O8Rn2TatfX7MJa9eDFq2EeMsE5I0fcVKsGSOefFo42dy63U8A6W/Gdr1ZOY08qPvChxhVLi5tU3
	or7RQiZi/Qxymx8xOxbV2yHr0XX4Ymw3HJJczcH35hRo7S9xgw==
X-Google-Smtp-Source: AGHT+IFIxrSX1h4lb/P7EJ1WT0XnDe4ratVjsi8oj/rTNnzAaf8kaqG7dznaMIlHFsUSHtkmsXQDlg==
X-Received: by 2002:a05:600c:83c4:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43d509ec52fmr66809825e9.8.1742664185409;
        Sat, 22 Mar 2025 10:23:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd17cfesm62340695e9.10.2025.03.22.10.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 10:23:04 -0700 (PDT)
Date: Sat, 22 Mar 2025 20:23:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
Message-ID: <9e956655-8ec6-4279-93db-9d12f6fa8d28@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-update-current-bus-speed-as-part-of-pci_bus_add_devices/20250313-195014
base:   80e54e84911a923c40d7bee33a34c1b4be148d7a
patch link:    https://lore.kernel.org/r/20250313-mhi_bw_up-v2-2-869ca32170bf%40oss.qualcomm.com
patch subject: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth before & after link re-training
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250322/202503222212.TmaQlYi5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503222212.TmaQlYi5-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/bwctrl.c:213 pcie_set_target_speed() error: we previously assumed 'bus' could be null (see line 173)

vim +/bus +213 drivers/pci/pcie/bwctrl.c

de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  161  int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  162  			  bool use_lt)
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  163  {
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  164  	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  165  	bool is_rootport = pci_is_root_bus(port->bus);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  166  	struct pci_bus *bus = port->subordinate;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  167  	u16 target_speed;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  168  	int ret;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  169  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  170  	if (WARN_ON_ONCE(!pcie_valid_speed(speed_req)))
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  171  		return -EINVAL;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  172  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18 @173  	if (bus && bus->cur_bus_speed == speed_req)
                                                                    ^^^^
This code assumes bus can be NULL

de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  174  		return 0;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  175  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  176  	target_speed = pcie_bwctrl_select_speed(port, speed_req);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  177  
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  178  	/*
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  179  	 * The controller driver may need to be scaled for targeted speed
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  180  	 * otherwise link might not come up at requested speed.
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  181  	 */
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  182  	if (is_rootport && host->ops->pre_scale_bus_bw) {
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  183  		ret = host->ops->pre_scale_bus_bw(host->bus, target_speed);
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  184  		if (ret)
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  185  			return ret;
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  186  	}
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  187  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  188  	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  189  		struct pcie_bwctrl_data *data = port->link_bwctrl;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  190  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  191  		/*
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  192  		 * port->link_bwctrl is NULL during initial scan when called
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  193  		 * e.g. from the Target Speed quirk.
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  194  		 */
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  195  		if (data)
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  196  			mutex_lock(&data->set_speed_mutex);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  197  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  198  		ret = pcie_bwctrl_change_speed(port, target_speed, use_lt);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  199  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  200  		if (data)
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  201  			mutex_unlock(&data->set_speed_mutex);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  202  	}
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  203  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  204  	/*
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  205  	 * Despite setting higher speed into the Target Link Speed, empty
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  206  	 * bus won't train to 5GT+ speeds.
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  207  	 */
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  208  	if (!ret && bus && bus->cur_bus_speed != speed_req &&
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  209  	    !list_empty(&bus->devices))
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  210  		ret = -EAGAIN;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  211  
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  212  	if (is_rootport && host->ops->post_scale_bus_bw)
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13 @213  		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
                                                                                                                                      ^^^^^^^^^^^^^^^^^^
But here it's dereferenced without checking.

8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  214  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  215  	return ret;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  216  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

