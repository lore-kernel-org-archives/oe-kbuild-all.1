Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0023EE1E5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845492; cv=none; b=GlDC+PHF9bImgyoYE7fz+5dPHO49jeAfBSmI+EFJJ9nDM1LYFszVggVONEHDJlFp7V341hnsdV4RKVEN/Enb6/0CofGMozkDyfhOQO0sG7ZWZbXnAedADd44U2z7qwZBfFuvtzeL2AmxUFVJb76MGx8c9SxjAPLbrXCaf2ksfLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845492; c=relaxed/simple;
	bh=eEmzTZNJpy92IDXcmsHqLyIsoGuM4v3QphkNBK7W50M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3Xi9ZBCAEDxeyOF+PQmVprK1mzNpSMK/OZ040u7B2VAP1eJd0A92DaGzZ4X7Fg7uzr6pnLq5Ah27wPv+24wAX2+OfnqHKHSdWwj+iOKLDDuGRmJiIWud5Xk/cISqmL4Eq/eBmKLyYzJyLWzYOiGv6BsHDOpeyLQmn+8KWBN2+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCOK+XHI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCOK+XHI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso47695315ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Aug 2026 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785845490; x=1786450290; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WYU2xrUhXHnrWis7kRDvro7H+NLsS+E3nbQEP4nnVE=;
        b=LCOK+XHIloXv/07BeFAOhf1H13lmzipPcxt1qMhb5bS98qF+3Odia7P/g9VtvagpV6
         xTTJOrnjojRDjg1aN79442bFrUYysipMhfOicE3Af5GwVQwTNDj0zsr5y9JGYohkw8wJ
         30Umyh8a+4xDSK6bhQRZNPhPWvlAQWCRS+lC2bpBsNihuJ0/Cz3sLnlpEkrFiJ4Fop6K
         m4SoG+1j/IJIQZnQU9UWJDYw+mLTqvtlLLpPXfdGoV4Fi+hMw2cBIePq7of4x5ae69c1
         Y0oM2pYuTXZm/Zll8bqKuKt8fjSkS6UwqDn1Zvcs3pts+WY1fFNOiMEYRrMDYIRCN30N
         AylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845490; x=1786450290;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WYU2xrUhXHnrWis7kRDvro7H+NLsS+E3nbQEP4nnVE=;
        b=crEjEYXfNDzHY9HBaVGz/MF01U3gAmDPGNr4l4Gc6dG4E98LzeEqG39pFZTJDGLmBk
         LtqVK/dks5q4vK5nkznnVVzq/cH/Ml3AlrlGDnms/Z5BWmIlnYgWIgXKWLcsNkvGhsnf
         LKVAq1koHgPvfWfyFbuemizeQdxMFZKSMvWwD8HJU1fWzHf03aUT+Jz+BTxP3dkmCILS
         j66KRz0Ofz7EBy5MN7UXMJlwcg6tsOOMYwTQ5u3nuoeUvo4rhiMI0Z2awyZuZQaEIckr
         uYi+CcJiaL7c59ayeaiPpsARPMk6RG3Anm9rdiYiF1wYFhYV9HvrqlsQ50Awb+c9+k0R
         RilQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPpdJktnHGtvhDTv0cDWdoEKv9ODDpAWxOmoJ1CX8q1nP/wDUBwKzeSkNoPvDCx6GJ0dId1QsP+oYjF9jP@lists.linux.dev
X-Gm-Message-State: AOJu0YynOSCyeULOeDa2aEukpSoyR844zWj8Cq2v8Waq36/6ThXB8NV7
	0H/1l4/uxIq7M+Wz0Fb7btHjyh54FFyDq6J5cmUwpOvlP5xaIhMm1G3C2fv2VAKge9s=
X-Gm-Gg: AR+sD10y9P8ECIfo6RgeS2EdzN8FB/SKq+KY6upXFfm/010fSicq2nlIoV+uk5Hdxr1
	ejptxs2M/NdM4ESfw9KH3p0gMCApMlHaFuv3pS0XFYw+1ut5ac6xGLZc35oCDh7B51sWgIH6PST
	sV4JCU8PTwTAh1zsqMnBR+SW1gfvaUlN22jmw/9HEDwsYx2a/5a9cxsP4z7TPBWSlRPAC9NrSJB
	UljkaViCoVXUlEr4Jm3TSXT87z3FqgJDymhJaWe+OMoYvMeQEZIVMU39Qth1Tn6pp2tQCruow+u
	HcmuTUgqNl7DA5oKyoHW0n4nc+4/jWbhZFBbn1UDqTzJAhudVoM0FIa2EQUkSf0AUvW8pbuKUzJ
	AqJJFkaiTti0qE57V5T+mhzPMnGLoUbFYAnWpmi4k4YHz711orvggFVvx5bqcI2JP4utmWo0mBC
	1XdvlCwdgph3PqQksmcAQZ0cBUbt8IMZC/GsC/uWH7uTc3SCe1NA2gsQ==
X-Received: by 2002:a17:902:ebd2:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2d0521ea576mr143978745ad.1.1785845490106;
        Tue, 04 Aug 2026 05:11:30 -0700 (PDT)
Received: from localhost ([172.216.252.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d68easm5985255ad.68.2026.08.04.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:11:29 -0700 (PDT)
Date: Sat, 1 Aug 2026 10:03:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Abhishek Dubey <adubey@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/net/bpf_jit_comp.c:550 bpf_jit_supports_fsession()
 warn: signedness bug returning '(-95)'
Message-ID: <202608010958.cYfBCQAC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
commit: 92258b5bf1ec10204c23a793793a65dc92d17014 powerpc32/bpf: Add fsession support
config: powerpc-randconfig-r073-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010958.cYfBCQAC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 92258b5bf1ec ("powerpc32/bpf: Add fsession support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608010958.cYfBCQAC-lkp@intel.com/

smatch warnings:
arch/powerpc/net/bpf_jit_comp.c:550 bpf_jit_supports_fsession() warn: signedness bug returning '(-95)'

vim +550 arch/powerpc/net/bpf_jit_comp.c

6fab063bd8d64f Abhishek Dubey 2026-04-01  543  bool bpf_jit_supports_fsession(void)
6fab063bd8d64f Abhishek Dubey 2026-04-01  544  {
92258b5bf1ec10 Abhishek Dubey 2026-04-01  545  	/*
92258b5bf1ec10 Abhishek Dubey 2026-04-01  546  	 * TODO: Remove after validating support
92258b5bf1ec10 Abhishek Dubey 2026-04-01  547  	 * for fsession and trampoline on ppc32.
92258b5bf1ec10 Abhishek Dubey 2026-04-01  548  	 */
92258b5bf1ec10 Abhishek Dubey 2026-04-01  549  	if (IS_ENABLED(CONFIG_PPC32))
92258b5bf1ec10 Abhishek Dubey 2026-04-01 @550  		return -EOPNOTSUPP;

return false;

92258b5bf1ec10 Abhishek Dubey 2026-04-01  551  	return true;
6fab063bd8d64f Abhishek Dubey 2026-04-01  552  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

