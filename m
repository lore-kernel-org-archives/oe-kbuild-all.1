Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7E97489
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 05:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710134773; cv=none; b=eIfFqz3jsn5ZMtwt996aUjDx7GSAD2OEY62vUbhsQ/61ElYrhzCQvwm8/i+lwC5ZpzWz3jC2oYorS6U+X28kGDmBoeOGocHhNNYbCMtpwWYCNQGqiU8DJke9nlDqCKKGRICVusl/hbW+ma6a325VaNOFoiBIEdqYxulMLvnVwmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710134773; c=relaxed/simple;
	bh=yUDW/fwoJIeQpIZIGKNfqge21MDz3OIIs6ywtRDXdZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RONkVVz/bGgIgE8QFDfgnIl5xdbfR36optVAJ4kXbxh8FM2yRB7AWLPysoRHo3fDWB+vMgIku79EFnL9RvNl8F6YYBuVh5TlVgG3OQnE4d8QhdbTR5Ek1DUNEpb0QoK2NS9vG57rpr0ooCUiA3dk55wR8B/6meHTXvbkUOP4zEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OtHApKpQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OtHApKpQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4132add50ffso1727365e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 22:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710134770; x=1710739570; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOlTd1XnDPAY74dQ3xemh8A6pnHKhsrOLL88PokMnLc=;
        b=OtHApKpQd0L0jiupsxFAe1Zu5J+L6ysKRpDp4hd1PurFiEhTjUD7fNra1CyLDbnHtg
         vuKR+qJIMUCrFdxU9RxWe0vyxzO+pOt/6QCO1pTA7WZSjj6KEGTatZ6gq3oye07HPK5b
         9/k39vRU2uFHQn+hDFlj0EDPWMmMoT73p41aqXB6pdU+bVTkbf8zIuCAGiwZ29pw3jgO
         aNQRbyNnbESoQ6dK4WXnDhp7Tq7EKsPBe10vl9s4guNSUdRs2zHjCEixEMP8KhOenpJv
         3CzII0GrQu+q1A0+iBW7vzbjNiDsNfqfjY7aa90AnzKocAQQxGuYY8Zplw8kJkdzM6WC
         /xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710134770; x=1710739570;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOlTd1XnDPAY74dQ3xemh8A6pnHKhsrOLL88PokMnLc=;
        b=G3hrz/MGrVTUYfRjaZPWeYKFG5ifwSM1hTZmnGm1D90kqJooElGqJQ8iax4gaa3wkn
         kNLqXxOlACdGpJ/1xIH9To4ZmzQHNPxVWPEhBudVSRN/zYnwSaliHHt/ogqgMkb6c3YO
         +I1vxSg+6pVuLME62SngfTc3bfyun20qpvny2VwWwA1A6vM70qHriI+7I3IuKshLAFN3
         dKG6KDhQ3QmpleiMfqg6q9YdhaQXcFcb98C+8bHEt9evpzbFXbOMBIqK4X/v5dFKoOC/
         lU5i4SafqEbvUSgvd5l2hRuMn9YRe1D4KCI9k39LIAOIEXbt2jFDEAJB9Z37d0WMdakF
         fWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo2TUyXTrB++N03qUKFFPMaOWMqfqkBRJrVEryADvP/1NTuODOedOF4gGQ9vf8gbJlVHlGnNqeoBfB0lpdtu56orucRDXXJDOSb2s5Xw==
X-Gm-Message-State: AOJu0YyAcpcNnMC/CuSx2ASzLvWK8qG9ICE0ZHl1d5hcbLA6vIeGeLVC
	OpLFOXL3ybKZozmn0SP30F/erpOBoyjKZYE8/FLvFlpJji1Led3OAnsYXqM3yYY=
X-Google-Smtp-Source: AGHT+IGaKiwrsxbFVObyt068tmh4cH4q7wAdph2jbY6/DLgmPo93xky/ezXahhnz+gYQmYhQXHUBjg==
X-Received: by 2002:a05:600c:154f:b0:413:1346:913a with SMTP id f15-20020a05600c154f00b004131346913amr4276392wmg.26.1710134769911;
        Sun, 10 Mar 2024 22:26:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a17-20020adffad1000000b0033dc7e50488sm5363181wrs.96.2024.03.10.22.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 22:26:09 -0700 (PDT)
Date: Mon, 11 Mar 2024 08:26:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pierre Gondois <pierre.gondois@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [linux-next:master 12015/12944]
 drivers/firmware/arm_scmi/powercap.c:723 scmi_powercap_domain_init_fc()
 error: buffer overflow 'fc' 2 <= 6
Message-ID: <30deb572-af44-46af-acbb-ead586812351@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 2441caa84aac8abf1be9e20db3e6bb921e74c8a2 [12015/12944] firmware: arm_scmi: Populate fast channel rate_limit
config: nios2-randconfig-r071-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100744.7Op3PI8L-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403100744.7Op3PI8L-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/powercap.c:723 scmi_powercap_domain_init_fc() error: buffer overflow 'fc' 2 <= 6

vim +/fc +723 drivers/firmware/arm_scmi/powercap.c

855aa26e5f56d4 Cristian Marussi 2022-07-04  694  static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
855aa26e5f56d4 Cristian Marussi 2022-07-04  695  					 u32 domain, struct scmi_fc_info **p_fc)
855aa26e5f56d4 Cristian Marussi 2022-07-04  696  {
855aa26e5f56d4 Cristian Marussi 2022-07-04  697  	struct scmi_fc_info *fc;
855aa26e5f56d4 Cristian Marussi 2022-07-04  698  
855aa26e5f56d4 Cristian Marussi 2022-07-04  699  	fc = devm_kcalloc(ph->dev, POWERCAP_FC_MAX, sizeof(*fc), GFP_KERNEL);
                                                                                   ^^^^^^^^^^^^^^^
Need to bump this value.  Currently it's 2.

855aa26e5f56d4 Cristian Marussi 2022-07-04  700  	if (!fc)
855aa26e5f56d4 Cristian Marussi 2022-07-04  701  		return;
855aa26e5f56d4 Cristian Marussi 2022-07-04  702  
855aa26e5f56d4 Cristian Marussi 2022-07-04  703  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  704  				   POWERCAP_CAP_SET, 4, domain,
855aa26e5f56d4 Cristian Marussi 2022-07-04  705  				   &fc[POWERCAP_FC_CAP].set_addr,
2441caa84aac8a Pierre Gondois   2024-02-22  706  				   &fc[POWERCAP_FC_CAP].set_db,
2441caa84aac8a Pierre Gondois   2024-02-22  707  				   &fc[POWERCAP_FC_CAP].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  708  
855aa26e5f56d4 Cristian Marussi 2022-07-04  709  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  710  				   POWERCAP_CAP_GET, 4, domain,
2441caa84aac8a Pierre Gondois   2024-02-22  711  				   &fc[POWERCAP_FC_CAP].get_addr, NULL,
2441caa84aac8a Pierre Gondois   2024-02-22  712  				   &fc[POWERCAP_FC_CAP].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  713  
855aa26e5f56d4 Cristian Marussi 2022-07-04  714  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  715  				   POWERCAP_PAI_SET, 4, domain,
855aa26e5f56d4 Cristian Marussi 2022-07-04  716  				   &fc[POWERCAP_FC_PAI].set_addr,
2441caa84aac8a Pierre Gondois   2024-02-22  717  				   &fc[POWERCAP_FC_PAI].set_db,
2441caa84aac8a Pierre Gondois   2024-02-22  718  				   &fc[POWERCAP_FC_PAI].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  719  
855aa26e5f56d4 Cristian Marussi 2022-07-04  720  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  721  				   POWERCAP_PAI_GET, 4, domain,
2441caa84aac8a Pierre Gondois   2024-02-22  722  				   &fc[POWERCAP_FC_PAI].get_addr, NULL,
2441caa84aac8a Pierre Gondois   2024-02-22 @723  				   &fc[POWERCAP_PAI_GET].rate_limit);
                                                                                       ^^^^^^^^^^^^^^^^
And this is 6.

855aa26e5f56d4 Cristian Marussi 2022-07-04  724  
855aa26e5f56d4 Cristian Marussi 2022-07-04  725  	*p_fc = fc;
855aa26e5f56d4 Cristian Marussi 2022-07-04  726  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

