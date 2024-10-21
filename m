Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22761D14E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495054; cv=none; b=BBXTtzFVx5IDMkIAQIdUEMEvDFX0ka5iFbUdtDKhifgZ/6+/BWDORicDuilMG8s31YYBtvkoEK9+KqERILlb8cSlC6Ru/PuYWWriRcAdJHne1MBvOSqx9IIMEahyc0h2J2h7689EVP3MyF8Zk3nnzEk1jI/ValmL8EdIzCe0VKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495054; c=relaxed/simple;
	bh=E7+7301djVpMUQeotCSGphW/XiK2+37+MdD3fplNdsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=f+UYYPdESjicQvKFXiw6SvxkiA8Sc5FzzREXSwvubJOdXQyO+EsoLC4Ys6VLRhFDdxaQatMSuM1+xkGMdAfyIdChcxDt3uZd9nJegz3n8hZrSHCGaiuui3YCatemBHDvtD3JOek9GzLom2klDz0eV8132KEyTL1wo3w3dHcu6lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pjz/t/Wl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pjz/t/Wl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso36140405e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 00:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729495050; x=1730099850; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+m8fTvMjxKK9SDB4irlUC6OD3WAtnh15KYs4Bil8CxE=;
        b=pjz/t/WlblkQ5ifoeyZyFeSn0w4E5GR5cfMJjM6afaKqbqqsuHo6WBXsFERm8eGXS5
         UVZzoIgYwHHlKnjqu4PJAaRRcHxglBsBnbiDXqMPmL9HF3RIH0k+4E/X+ExRf2/6AG+u
         dh6X3Q+aXHSCX28aSIfEHmq+swgJupipeNAcdDVZMBGYy4myBV2AEUaLmoA9YD0ykLpK
         CTpxxlphqIobdnLvs/Voais6KhnQLs7drqSWHSZ2DXW2VWmCAQWIlw41zHFT/78CcpxJ
         oAz5dpzwI+sEcjryh+7uTkw6Zy9nVkg9yHrkUZe2gTud8XQ9N7ANmPR5NbOHGeppbdhM
         It9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495050; x=1730099850;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+m8fTvMjxKK9SDB4irlUC6OD3WAtnh15KYs4Bil8CxE=;
        b=C4QF3o91WD6f3VI5UnXk/IMYSGeZ7TPRiRrZlzU1/hW7yaNzrCCay3WZYVOFbseqef
         hZCoTCTfpg7dSxcA/Hmv0hlOVMcVej53zxEcXFrGW1QqozUglmB/iS+H6Tzws4/YFSoM
         cTfoh9SHVXK7/BFGvj0lCGIdGdfe/rFHKhQ3T59E7XFuZg6zPu7d/PbH1LVTU6/9Cjsv
         JSduisvLArILHgJYxpldlXn+M72ELRUUpOkSfD5vA0qfTpppAEAieqTmbkcHJ/vCzojR
         gTP/EcxB/ynv0OW4Ia+k9ZApp7H+WDHJeOnrOR9V2IfXslWnMTxpLBF1A3f6x7jOBEDI
         eoCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8Ayr6HIuh3vwO7x6LOGdaT79KlQTdcDbn4KkYQ4hlgVrCfXeR4hYpUkZpb36JTIvFrJ0T5ljaXWBQuxZl@lists.linux.dev
X-Gm-Message-State: AOJu0YxUJ+5awIfBfPhUi2s4co3NmScEEG3YYJbhNR/wa4gdxzNwNbkB
	1PbLqCoE1csS7yvx/uVi6WsqIt5Svvd3aAs8eoR0DXEG8U8bWBPbelNISaDImE8=
X-Google-Smtp-Source: AGHT+IGXcjSY/qQ6Yjj36xtAVc0dYZUUx35AYEwS9RfB1wu2AACGrjRhixmmA0i0CqZsSES/VJFNnQ==
X-Received: by 2002:a05:600c:1547:b0:42c:b508:750e with SMTP id 5b1f17b1804b1-43161627e3emr113376925e9.11.1729495049729;
        Mon, 21 Oct 2024 00:17:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431605f81a2sm112892065e9.0.2024.10.21.00.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:17:29 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:17:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Guixin Liu <kanie@linux.alibaba.com>,
	bhelgaas@google.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: optimize proc sequential file read
Message-ID: <206eef75-bd2b-43ef-a324-6556c47c9b93@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018054728.116519-1-kanie@linux.alibaba.com>

Hi Guixin,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guixin-Liu/PCI-optimize-proc-sequential-file-read/20241018-135026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241018054728.116519-1-kanie%40linux.alibaba.com
patch subject: [PATCH] PCI: optimize proc sequential file read
config: i386-randconfig-141-20241019 (https://download.01.org/0day-ci/archive/20241019/202410190659.9MCI8EyL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410190659.9MCI8EyL-lkp@intel.com/

smatch warnings:
drivers/pci/proc.c:365 pci_seq_tree_remove_dev() warn: variable dereferenced before check 'dev' (see line 361)

vim +/dev +365 drivers/pci/proc.c

4ca256d9a0e58a Guixin Liu 2024-10-18  359  void pci_seq_tree_remove_dev(struct pci_dev *dev)
4ca256d9a0e58a Guixin Liu 2024-10-18  360  {
4ca256d9a0e58a Guixin Liu 2024-10-18 @361  	unsigned long idx = dev->proc_seq_idx;
                                                                    ^^^^^^^^^^^^^^^^^
Dereferenced

4ca256d9a0e58a Guixin Liu 2024-10-18  362  	struct pci_dev *latest_dev = NULL;
4ca256d9a0e58a Guixin Liu 2024-10-18  363  	struct pci_dev *ret;
4ca256d9a0e58a Guixin Liu 2024-10-18  364  
4ca256d9a0e58a Guixin Liu 2024-10-18 @365  	if (!dev)
                                                    ^^^^
Checked too late

4ca256d9a0e58a Guixin Liu 2024-10-18  366  		return;
4ca256d9a0e58a Guixin Liu 2024-10-18  367  
4ca256d9a0e58a Guixin Liu 2024-10-18  368  	xa_lock(&pci_seq_tree);
4ca256d9a0e58a Guixin Liu 2024-10-18  369  	__xa_erase(&pci_seq_tree, idx);
4ca256d9a0e58a Guixin Liu 2024-10-18  370  	pci_dev_put(dev);
4ca256d9a0e58a Guixin Liu 2024-10-18  371  	/*
4ca256d9a0e58a Guixin Liu 2024-10-18  372  	 * Move the latest pci_dev to this idx to keep the continuity.
4ca256d9a0e58a Guixin Liu 2024-10-18  373  	 */
4ca256d9a0e58a Guixin Liu 2024-10-18  374  	if (idx != pci_max_idx - 1) {
4ca256d9a0e58a Guixin Liu 2024-10-18  375  		latest_dev = __xa_erase(&pci_seq_tree, pci_max_idx - 1);
4ca256d9a0e58a Guixin Liu 2024-10-18  376  		ret = __xa_cmpxchg(&pci_seq_tree, idx, NULL, latest_dev,
4ca256d9a0e58a Guixin Liu 2024-10-18  377  				GFP_KERNEL);
4ca256d9a0e58a Guixin Liu 2024-10-18  378  		if (!ret)
4ca256d9a0e58a Guixin Liu 2024-10-18  379  			latest_dev->proc_seq_idx = idx;
4ca256d9a0e58a Guixin Liu 2024-10-18  380  		WARN_ON(ret);
4ca256d9a0e58a Guixin Liu 2024-10-18  381  	}
4ca256d9a0e58a Guixin Liu 2024-10-18  382  	pci_max_idx--;
4ca256d9a0e58a Guixin Liu 2024-10-18  383  	xa_unlock(&pci_seq_tree);
4ca256d9a0e58a Guixin Liu 2024-10-18  384  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

