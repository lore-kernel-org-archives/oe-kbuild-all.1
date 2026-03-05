Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A00739150F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714926; cv=none; b=jZaDRZgo8HT0tx+UuM+zX01kWKpbMMp7nmJdrJVeVii67B5A5a9zWq5ojyrQ9lSFdrxAMgtgXwEFDnaxIq2cq1FPR9ISOsn328N7slMjdaUpx1WsadY7Srv/LRWrMqrOLRpaMg91VopQFlEJXINgnXXhel9HI+mjHCqQGzD2zeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714926; c=relaxed/simple;
	bh=xgkABJ9B8ONELAl8NPb+eTgwheFOkrLUjxqole2DWOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INX8BzG7lXbcpxpFQiwefbpeHoCXZDqr8sTY9Sj4snTJ1psVslLfiRL1JsPOOTfeyE0dRRbfVc5AA7aYWMU2Urjh8itbV5UgIFwCmaxtfUs1Z8zS4Mli0Ukv0il4KazgErJ0UaYVIr6G9NhS9UX2AjzuQuPTWJvgnQMX1QYtArE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nm4XaUZW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nm4XaUZW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4837584120eso60683635e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Mar 2026 04:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772714924; x=1773319724; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF3Jt8+kZfWxPSpR81XkdalwEBQNNmKeqG6z7c/Rlac=;
        b=Nm4XaUZW57eD/KuVSMY9vP3uMkpNsiqdyLH6wDtv3Ik7rYMGxjXYGs68Cdn3BYmxzy
         Yq0Yf0ys5qtEB8t9QNsUDsEpkda58K7Td8QtDmJYUcR4LAoxuC5C0tJGThmuDPYo+Zba
         SU0dvR+/MV2KwGFEAUJ+iYbU+6S22WKEsJ3rXnPYeD10XB8gqUD7OmYfftt2gIRBJNoq
         OBbNhNAQYIJK58LQs0zSiFNPkkt/M2TkT4lY4I6s29K76qlGMBweMtJ9/SdpsJmyp9ve
         4eZTTC5T9sT2NOKOAy6AzTFsxJ6/hbNT0JzUd6sY2S9WBLq0OPDAvqzCxut3ncfpVGO9
         0Vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714924; x=1773319724;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bF3Jt8+kZfWxPSpR81XkdalwEBQNNmKeqG6z7c/Rlac=;
        b=EgIzU0Q7MJ4szyD+X+Gf3eerTGmsSb3CSVopOO2Gg//BVoFRY007EMl3UT/RDG+1ah
         bgGrlJVVSX9obomp4UOCpd77mz5CJgoZN550VTZkzBtxUBx3bptN9o15NIZ9glELE3R2
         hBHAvfCUVGoikDxFD9cAxsSy4kze4zXtfOOA/HT11WlofNjO23Pecnl+2OO0zmPwdUbq
         NwPdFrf24azHTfwU3yfR9lr0UDm80kRTYqUKjaAW5br0EiCibjuR2VCeRMTCefBM8AwI
         nbNqoYQxR8oMrxgLYwQd5MQUT+g+vIGqrkyelY+XS2xKuEiNa6tyYyWLL/Ly46+Kghrh
         LqXw==
X-Forwarded-Encrypted: i=1; AJvYcCUazVsIC7fjThz8TKV5ckLuat/MrIEq9vHrETF3xDBdXjIN8L7f+BoPUNn9mktKcfWL2xuGXjhApFdaSoyR@lists.linux.dev
X-Gm-Message-State: AOJu0YzxfsnFIe2fDSQ8G40AdPKNKD+fTHt1R7BN9FYD17+DouuvVcKE
	55WFQTMSUIsQEa3O1UTguG+MmHuWjhl2WcoS0eO3UxGDFA6l1stV2N1G1jkncWbs8XbZSsUfik/
	/4srF
X-Gm-Gg: ATEYQzxJ2Gp/oSFPZXHzkIQp5Qgc5UrzSeV5tdDhMZEWcof9OmdxQpsvDJP69n1CMhR
	339Su3HAufpICoxt0+DNvz4E/F41x6X4/SHLG7wmaTkVJ9mUOKdYZEhRcOGvPTcu9xoT1jQGTGc
	5cB37ZR/RS0FC5lqUZ/+6M+CaMvdCDxBAnsildRvNkpP7RQ71wtL77gkSERynUAQuSk3pGoE9W/
	D1UMLo4eDs4ldOlZvCXR+egFXcJZCQfk2C5ZK2FlNMVnUds5SsXyKsqS3rHNAXdQ4n4nOHCT4I6
	y2wdVyubGd+1ewryMTu5Sw7nKIiK8KpKdIiYcX5X8cpFIq/BWceQfBPBHveM1Fn+ZhHf3CnH1W0
	n+jAbRiDqD2FknvgQF+DOyEiwRboG/SPxvJWAA/YQa511l7FzdRbEwmhpcbs1TtQquFj2UC1WYu
	o6bNc5ZQRBJeB42Ts+7iGHugyGndk0s/UUrxdJA+4=
X-Received: by 2002:a05:600c:6389:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-485198a3c2cmr91882675e9.33.1772714923573;
        Thu, 05 Mar 2026 04:48:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a895553sm92101715e9.1.2026.03.05.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:48:43 -0800 (PST)
Date: Thu, 5 Mar 2026 15:48:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Farhan Ali <alifm@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [pci:wip/2603-farhan-s390-err-v10 1/9] drivers/pci/slot.c:40
 address_read_file() warn: impossible condition '(slot->number == -1) =>
 (0-u16max == (-1))'
Message-ID: <202603051816.NIWQx7m0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git wip/2603-farhan-s390-err-v10
head:   d72875f0a4958f51f7196e6fada9357799418a52
commit: 77c0762d2e847cf2e8d6d79e6f88a1c2b1ca4d06 [1/9] PCI: Allow per function PCI slots
config: i386-randconfig-r071-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051816.NIWQx7m0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603051816.NIWQx7m0-lkp@intel.com/

smatch warnings:
drivers/pci/slot.c:40 address_read_file() warn: impossible condition '(slot->number == -1) => (0-u16max == (-1))'

vim +40 drivers/pci/slot.c

f46753c5e354b8 Alex Chiang          2008-06-10  38  static ssize_t address_read_file(struct pci_slot *slot, char *buf)
f46753c5e354b8 Alex Chiang          2008-06-10  39  {
77c0762d2e847c Farhan Ali           2026-03-02 @40  	if (slot->number == -1)
                                                            ^^^^^^^^^^^^^^^^^^
u16 can't be -1.

f8cf6e513ec4f0 Krzysztof Wilczyński 2021-06-03  41  		return sysfs_emit(buf, "%04x:%02x\n",
f46753c5e354b8 Alex Chiang          2008-06-10  42  				  pci_domain_nr(slot->bus),
f46753c5e354b8 Alex Chiang          2008-06-10  43  				  slot->bus->number);
f8cf6e513ec4f0 Krzysztof Wilczyński 2021-06-03  44  
f8cf6e513ec4f0 Krzysztof Wilczyński 2021-06-03  45  	return sysfs_emit(buf, "%04x:%02x:%02x\n",
f46753c5e354b8 Alex Chiang          2008-06-10  46  			  pci_domain_nr(slot->bus),
f46753c5e354b8 Alex Chiang          2008-06-10  47  			  slot->bus->number,
f46753c5e354b8 Alex Chiang          2008-06-10  48  			  slot->number);
f46753c5e354b8 Alex Chiang          2008-06-10  49  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

