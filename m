Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5231DC988
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161072; cv=none; b=QVWtSLMOODieBpGqHhjCYo1Z+G05Dx98wnyLKisCnzIzwe5BVUnIRUwAc6z8cxN2N5x6j/85LWhd4fNpt3bl3j1zbC35/fAx1Vh4Sw0WwPbtqnyLJ1t0/eXG6d0xQuXbgFWgB1OEWPGw0ghIuWNhqbaZ/ALRQmhfgtWNXqkebeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161072; c=relaxed/simple;
	bh=UCgVkiom8nz4fIeV6EvMKy0EzhRWuAARQZZdbRoyRGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcbZHogULHdvNTk7Wp/bGnB6P8Ait4/zyV37d08L1w1MwXZMOdAs1wftRR7CQEfoSES00VeH3ahvzqpH2yow7b0n+8epOF0XNdEBEq7rGE8ZXGWycjW8BBgX/c3GOvz5TH0oUE3S/2NX34onqzQ13WuVmLiZHeXwL+6fHRcaHyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zVGE7MV7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zVGE7MV7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso149239345e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 02:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736161067; x=1736765867; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPRobQRsKCwgVrxpSoPXkw2vC8TTf35HhDAtS269Z9g=;
        b=zVGE7MV7H4d5hKc+wdGz71GO+fyEDUO1TM9WuM+clSOrQwQVo1Pkdo2GJe4Rq7RDUz
         +WInpqXFkYTwhvUmOlYmXnbdXpIBe8nk8wwF2fO4T+MSH+O9Pe0GzhmKAJk3VmulCE18
         U+H7xLjbT063oVPKeAu6so2e5KJ5zq9dCni/CtBZu7a63k7SFAB7VGd0SiC6RW2Ax9Xq
         cT+pBO2BOC6PTb0BhxM1kmp1FAyBphdZK7uMxuvbpy9NzX2PlL9dKGWi6k4ebDUYcK9j
         bi0eRVcfW8SiRzx/q9hI9Cs7pKHKK7Hj42Aj+hqP5U4AKQiJOBVwFKb10BJ4i3nIRLJJ
         vfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161067; x=1736765867;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPRobQRsKCwgVrxpSoPXkw2vC8TTf35HhDAtS269Z9g=;
        b=Zt9yQnnj+f3G0ZCQ6lw9t4+lra661GTaywSbK837pu7a3zfSQTD0FfJZPR4J9A6J9k
         RsgvRPZoirwdLc1Q3FzT9Y7zHtmTRbUnrqvEe9aBcmaFFxIp7mL950xPmitqA5DPvLtA
         Dmj708UEdcxbJLWdM/LytKxszhSmzpJEgY3hatg8wfPEgMyOdrvrBYXFXiTkK+YHUSXb
         gTiV2ByJ/QHi4g/XAGJOI2InHVCSu/2izNilsHSymakALCTDcVetc6sHvSs4ydt6386M
         9cqhZH21pP1NCk0A5zEvcLWYavFbohqoPVCgUUSDt2kHmUPky18rapD9En8bpIIbzCWg
         NFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeS3lG5Le3QfVmpQFhGou0ZDTU8BrP6OOKiJQ/A78OoYniPWrmf1PScHxVZunW4WfUBXSC95Jsn407V2nD@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0zsWV3cJgdjMmNpjeb55D/++ZoMVPjGf/TMQ/42IpZuFwM9Jy
	pGAer08QAVMmNxkRg/E/5Y6JUW+vWEKKev1ArhfMzjz1q9bvjM1gS68JTZCo5X7pNWL0g3yOr4Q
	l
X-Gm-Gg: ASbGncsvWFEXViggZUMjpNjB0ngtyhQyK8meUjX1RRGyWAgKUjT942Hj4SBLMZrruDS
	MpU186ENDK3dDP1XJEZka7VYckH1AlynS5J+k5MlReil5bOfzKtxcY7/oRFHMzrZdZ5VX4RmxmL
	cUGm3Z0As07KZa3OupOx8vKbSSPwX1Jr/Aoox+UhxtOW0F6LR72Eb8R96H3a3yonohm1AwvI7FV
	JP9XEMmxzDIZC3IUF4FzLuLOeHv9PH0XNyGTEa4wL7SN2gTSYXYEiUWmvkRHw==
X-Google-Smtp-Source: AGHT+IEENb3C2pGCCmedXyTv7pK4hdKmlEB7QTh/OUuMs1YXX+u96gMpPfBQoZbIzeQgcvSEa3mFqw==
X-Received: by 2002:a05:600c:1d07:b0:434:a684:9b1 with SMTP id 5b1f17b1804b1-43668548986mr482710945e9.4.1736161066989;
        Mon, 06 Jan 2025 02:57:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b00cf6sm606610235e9.10.2025.01.06.02.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:57:46 -0800 (PST)
Date: Mon, 6 Jan 2025 13:57:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 99/99] drivers/mailbox/mailbox.c:485
 mbox_request_channel() error: 'chan' dereferencing possible ERR_PTR()
Message-ID: <14cf2535-55ed-40ce-85b6-fa22ebd961f0@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   470a6487b5bb9674538d8dc645791263251b6996
commit: 71e4fcb288df366078213ba4fcf976f12a14d5e2 [99/99] FROMLIST: mailbox: Add power_get/power_put API to mbox_chan_ops
config: i386-randconfig-141-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310057.CBZZURC9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412310057.CBZZURC9-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox.c:485 mbox_request_channel() error: 'chan' dereferencing possible ERR_PTR()

vim +/chan +485 drivers/mailbox/mailbox.c

2b6d83e2b8b7de Jassi Brar      2014-06-12  444  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
2b6d83e2b8b7de Jassi Brar      2014-06-12  445  {
2b6d83e2b8b7de Jassi Brar      2014-06-12  446  	struct device *dev = cl->dev;
2b6d83e2b8b7de Jassi Brar      2014-06-12  447  	struct mbox_controller *mbox;
2b6d83e2b8b7de Jassi Brar      2014-06-12  448  	struct of_phandle_args spec;
2b6d83e2b8b7de Jassi Brar      2014-06-12  449  	struct mbox_chan *chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  450  	int ret;
2b6d83e2b8b7de Jassi Brar      2014-06-12  451  
2b6d83e2b8b7de Jassi Brar      2014-06-12  452  	if (!dev || !dev->of_node) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  453  		pr_debug("%s: No owner device node\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  454  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  455  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  456  
2b6d83e2b8b7de Jassi Brar      2014-06-12  457  	mutex_lock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  458  
2b6d83e2b8b7de Jassi Brar      2014-06-12  459  	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
2b6d83e2b8b7de Jassi Brar      2014-06-12  460  				       "#mbox-cells", index, &spec)) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  461  		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  462  		mutex_unlock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  463  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  464  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  465  
2d805fc1c6b2ec Benson Leung    2015-05-04  466  	chan = ERR_PTR(-EPROBE_DEFER);
2b6d83e2b8b7de Jassi Brar      2014-06-12  467  	list_for_each_entry(mbox, &mbox_cons, node)
2b6d83e2b8b7de Jassi Brar      2014-06-12  468  		if (mbox->dev->of_node == spec.np) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  469  			chan = mbox->of_xlate(mbox, &spec);
8ed82e23875e60 Mikko Perttunen 2018-11-28  470  			if (!IS_ERR(chan))
2b6d83e2b8b7de Jassi Brar      2014-06-12  471  				break;
2b6d83e2b8b7de Jassi Brar      2014-06-12  472  		}
2b6d83e2b8b7de Jassi Brar      2014-06-12  473  
2b6d83e2b8b7de Jassi Brar      2014-06-12  474  	of_node_put(spec.np);
2b6d83e2b8b7de Jassi Brar      2014-06-12  475  
2d805fc1c6b2ec Benson Leung    2015-05-04  476  	if (IS_ERR(chan)) {
2d805fc1c6b2ec Benson Leung    2015-05-04  477  		mutex_unlock(&con_mutex);
2d805fc1c6b2ec Benson Leung    2015-05-04  478  		return chan;
2d805fc1c6b2ec Benson Leung    2015-05-04  479  	}
2d805fc1c6b2ec Benson Leung    2015-05-04  480  
85a953806557db Elliot Berman   2023-04-10  481  	ret = __mbox_bind_client(chan, cl);
85a953806557db Elliot Berman   2023-04-10  482  	if (ret)
2b6d83e2b8b7de Jassi Brar      2014-06-12  483  		chan = ERR_PTR(ret);

chan is an error pointer.

2b6d83e2b8b7de Jassi Brar      2014-06-12  484  
71e4fcb288df36 Jason-JH.Lin    2024-06-14 @485  	if (chan->mbox->ops->power_put)
                                                            ^^^^^^
Crashes

71e4fcb288df36 Jason-JH.Lin    2024-06-14  486  		chan->mbox->ops->power_put(chan);
71e4fcb288df36 Jason-JH.Lin    2024-06-14  487  
2b6d83e2b8b7de Jassi Brar      2014-06-12  488  	mutex_unlock(&con_mutex);
71e4fcb288df36 Jason-JH.Lin    2024-06-14  489  
2b6d83e2b8b7de Jassi Brar      2014-06-12  490  	return chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  491  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

