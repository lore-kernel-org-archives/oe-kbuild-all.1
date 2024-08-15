Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E87DA8E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723737558; cv=none; b=srVpBwCelnveecFrGlmpSrU71P/UFUkUY2SkgE3BbikG1dBaD7IhOf2DHHAgZmufT2wXxhnMxqUuo+PqTjv+tkoJM+7p2oY9V4LS7U9RvGR5AzRbhTRVkXBF7dE9ZLRR+dMg8BvfqbQQf7+OMDCRLmPRjRthENUqKHxwr4Exrno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723737558; c=relaxed/simple;
	bh=Z/fyRi93/FgvuhZIwHmKOmN49p2qBtOwlI7YvJ6Mm3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8sj/0qq35vVUhxeqCQWCcAKX1KIO5yq8Fxf5sno7cPeW5erWJPl/HujnGo4lMQX5NPLDEuWY4dBG37jQNR3i7eaQn64A9wsf8n8KqE+io+XpF2ykRT+DPwEr+7wdKkXOCe5Z+YiZExVlOA/SiX0DVwSIvBs2g4k1L/4ngOW/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DeZ4dyu9; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DeZ4dyu9"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7a115c427f1so823994a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723737556; x=1724342356; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Go1TBNFKLXqY7P67ovoHUjFQplVz6G9uJaPMlcb/pTE=;
        b=DeZ4dyu97JdurfTCR8S5xj3c6ZXDYpd9HfTym0l1aMXHU/lPmmDMOUG/UCbTut7dQT
         QggD7ekXJLXvDxa3+c46q/GHYZqYvjm7yzlpcfMJROG1aVP1qkBAMpXCNqtWhR5EB/dq
         6FHZ7aOl5i5H1XP1e4JBD/QQCxsCdwPMemNiWJRlIYMuxQkHRrma1f5BqYPuVjJWEtdi
         /bK9udJhbxnTNltOg3fAL0Eu0+RUc50RsG3YOK94fpEzHftvX/vHz5Hllv2uVsy7Uxoq
         SJRM/f//NmBzp4+c9NGGc9yFXKOmJucHgNnKLGlrbx9AJJIsrHKNx9+nq9pD4gH1rbCM
         ccfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723737556; x=1724342356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Go1TBNFKLXqY7P67ovoHUjFQplVz6G9uJaPMlcb/pTE=;
        b=PGr7HY09Pmmsenn04m8Vw77gAwd+aX6KG90MffXSCZ8IeYwbtxH/haBUELm+hQH4Zo
         Ba3a8ANky+OqAcjXj/iXxlVb2EKVnrxZaeJBdRn1lSJFqEKb6dfdUeNbvQ8Qihz2d/+l
         w2Fqvnmv/qH3V5Zk4VchNiam4qW4q7MzYUCjLVc283qxuR3d0hGIux9cbLH3F7/uEZMH
         KLtwkb484s4rEo8HixdPzfB7gFJrjrCmFhF22/v68YXhkf8hipYvSjaLuchto3z1U8Ng
         T7P5Z3U6GdF+T4M2wlkyT3NWd4fX2KSN15tsytMZ3Bw8yvZY/Onbr7//iyl2ge1YYnpY
         yCSg==
X-Forwarded-Encrypted: i=1; AJvYcCV/nTnkY58M758P8E7zPIrcOj2OxsMYuWSJ+pJ6+Iy0Dj+pyiwrWRytfq1+8qr7tf/vpnBn0DweurkbU3JWmzQmChzzy7IOGL/YaxqPuA==
X-Gm-Message-State: AOJu0Yx9xQcKg9wEEvTAwr+3bwIlnQlvilhL2Rja16nz3gyI05AtHhXi
	KTmpGQrETSNUyJS5825QeHAwbuZUUlt/0Op3wUZ4Cv5SFSfM9lsl8ksR6ejU7g==
X-Google-Smtp-Source: AGHT+IGk4qceJ8StUFPW4JHw1XS1cn4wjioyj97u+D8ec4AIR96mMNUmXxt7TcNKR/bC4iSHsI2ajg==
X-Received: by 2002:a05:6a20:9f90:b0:1c0:f529:bad6 with SMTP id adf61e73a8af0-1c90505350emr174630637.45.1723737556019;
        Thu, 15 Aug 2024 08:59:16 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0393684sm11660685ad.239.2024.08.15.08.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 08:59:15 -0700 (PDT)
Date: Thu, 15 Aug 2024 21:29:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kernel test robot <lkp@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 05/13] PCI: endpoint: Assign PCI domain number for
 endpoint controllers
Message-ID: <20240815155909.GD2562@thinkpad>
References: <20240731-pci-qcom-hotplug-v3-5-a1426afdee3b@linaro.org>
 <202408111053.0PLHSTeH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202408111053.0PLHSTeH-lkp@intel.com>

On Sun, Aug 11, 2024 at 10:47:08AM +0800, kernel test robot wrote:
> Hi Manivannan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam-via-B4-Relay/PCI-qcom-ep-Drop-the-redundant-masking-of-global-IRQ-events/20240802-024847
> base:   8400291e289ee6b2bf9779ff1c83a291501f017b
> patch link:    https://lore.kernel.org/r/20240731-pci-qcom-hotplug-v3-5-a1426afdee3b%40linaro.org
> patch subject: [PATCH v3 05/13] PCI: endpoint: Assign PCI domain number for endpoint controllers
> config: microblaze-randconfig-r072-20240810 (https://download.01.org/0day-ci/archive/20240811/202408111053.0PLHSTeH-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408111053.0PLHSTeH-lkp@intel.com/
> 
> New smatch warnings:
> drivers/pci/endpoint/pci-epc-core.c:843 pci_epc_destroy() warn: inconsistent indenting
> 
> Old smatch warnings:
> drivers/pci/endpoint/pci-epc-core.c:908 __pci_epc_create() warn: inconsistent indenting
> 

Krzysztof, will you be able to fix the indendation while applying? If not,
please let me know. I'll spin v4.

- Mani

> vim +843 drivers/pci/endpoint/pci-epc-core.c
> 
>    830	
>    831	/**
>    832	 * pci_epc_destroy() - destroy the EPC device
>    833	 * @epc: the EPC device that has to be destroyed
>    834	 *
>    835	 * Invoke to destroy the PCI EPC device
>    836	 */
>    837	void pci_epc_destroy(struct pci_epc *epc)
>    838	{
>    839		pci_ep_cfs_remove_epc_group(epc->group);
>    840		device_unregister(&epc->dev);
>    841	
>    842		#ifdef CONFIG_PCI_DOMAINS_GENERIC
>  > 843			pci_bus_release_domain_nr(NULL, &epc->dev);
>    844		#endif
>    845	}
>    846	EXPORT_SYMBOL_GPL(pci_epc_destroy);
>    847	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
மணிவண்ணன் சதாசிவம்
