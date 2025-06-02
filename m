Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D06101EE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 06:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844450; cv=none; b=mtM8pLUSo9RgRHHvWp3Eoijs/X6UqAw7kX8dYqT7LNEbHDa6ma1v3jK6IWb7ynvLS760kCjLHPodZSVQI0VDYuUshkjp2/gmLpkSJDjXMVe+WECuNe7kOt95NgR6Q10L9ve7bFpbQGpqRMAB/wq/nV8Zi2/E0/75ozNfgzSS4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844450; c=relaxed/simple;
	bh=eKkxuOAoMqaTN/DTzwoYH+uzPpC/Oh1dq0lX30umzkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iGvg7jABwq+ENWXwc8b7W08TaFf+m/ZGTDz1kUDxdBOaX0RGyPQk/YkV9HWW3MDhwwHJs76nV80GmOhx2nMnXOcQA5aGZ8Bir69evymAk69a2DE2vKgay/eZFZ4SwXQ+K219ouLa2YUptJgx1uIhEP2uhewFHOHaX0uWS5gdxok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fCCAUp+/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCCAUp+/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a5058d46ceso455610f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Jun 2025 23:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748844447; x=1749449247; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXMWqAZm6FMnPa2V1XlPw9prX2Q3dxL8CbJ/3dj6grw=;
        b=fCCAUp+/7nFm1iVGh2kcds5CUhfbdzYA05AOzDbYucE3LNwOtFMYjeETAIdDkxe4LU
         vyme3lgJeDqTi+F0nOpF1RFTz8zvjfqm6/Zs8dxm+AAOBG3unRCJwwH+7PauiutXtaKV
         ulf5aj0xX2MriDNjR55XZs7es/I+771+MF0oMTXNKI9THRBDKe/nmPGU+b4JHwc5cOwZ
         unUFD97cpDKHAM4kE+6DtWIJZwzKPQymjNOguIqbnAZQ78cE0FkuSq3xA1v3N2zO1UoA
         PW7LP/jZnrHdS0fmJ7n44eOZ+4lDB6a7fIOZHWunJ2A4ds31tQqDMoyCILTMSZ5SMKYH
         /dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844447; x=1749449247;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXMWqAZm6FMnPa2V1XlPw9prX2Q3dxL8CbJ/3dj6grw=;
        b=NAMTok6qeqr2u/1dT46Qc/Rdc7ADzVCKZYJzsFUnoKEgDpu2wNoYcsLkbDeV/CCS8e
         ruBsbqXMVLvopWAmI/EmwEoWqyLAKScEg0Ob6M8xJPxhkIhDPXjZ5RwnzpsqIev9aN69
         o+hU5yNe6wouXUDclos6HT7oIGBb6E16dTruvdYXhPGMqDUDJ2u6QSuAcsOSYXw7oR+n
         WqUCWkcoUdK0/vlZ1fDvnEQ8p++PuDZHvL83RwOAPz/vxFzMIJotDSL3o7SrYKXVvuth
         CpVxXOPnCkSaSD3rpTCQ4pmuud4goGAtlOMVhxGaqev1RVSGZP7r//EtNKlpHJ0X77HU
         5/bw==
X-Forwarded-Encrypted: i=1; AJvYcCUlFsFnEMfy0UJiMwpFu63W+xixp5meQYydxCnjo4DizoZP0HzUloY7En6zuk5OtPPSrG9GrWKm+L8lvYgE@lists.linux.dev
X-Gm-Message-State: AOJu0YxHnYrOEWvYAmDN5cjubKo3JUroxYl/9JLYBVZMm2MvEd8YE8BL
	zhdpvTnRZ0l/CkZeR8BeMGjpz6CpkGZWb3usfC6RL4PM3FXHha8vUUARhW2R2PsCte0RoqT0QBh
	ExAp7
X-Gm-Gg: ASbGncuX80cWAuH8THt4/fdTM+8hLUI0VSAJQziJAjwxdhuPCQGNsGjbLYgtb0nYco5
	Unecasuo/JLQB6Qi/rC60nvNu3LCbt061HwFFJdH8Y3uaoF5tIEONk8ZgHNMF70/VN4LT8Ok7Du
	lAx7Y+dwabpZAHsyimkohWrJ23CwchyTUijinliydd6cQCYRxgvNP9P6FXbOLP4Cv5u+ACsTR2i
	51spalCUyhPm68EQU3vc6TqdwnwsoQQEtsj3sgLd97niw2i5amNPCGaTkeLvaUUVIEh9w6H/SeR
	DvYerxAuabFjbRqWv0xdIiTtekGLNbxrLzP8dmkV2uv0KaUg0S6UgboF0c9kJS+W4g==
X-Google-Smtp-Source: AGHT+IGM2jDBAjMDfse8HzUmPeYkWTYOa9PQEphSfiSMExO266s5gEuxvs2+0EQcaEeaYxl8JiO5Iw==
X-Received: by 2002:a05:6000:1a86:b0:3a4:dd02:f565 with SMTP id ffacd0b85a97d-3a4f89a7c39mr8495882f8f.3.1748844447265;
        Sun, 01 Jun 2025 23:07:27 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fb80e9sm106982005e9.27.2025.06.01.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:07:26 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:07:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.2 10/17] kernel/sched/bpf_psi.c:130
 bpf_psi_ops_reg() warn: passing zero to 'PTR_ERR'
Message-ID: <202505290712.WBOvBoOQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.2
head:   e3a569772f1fbe667574cb12da7cf500a0c91475
commit: 343586cf71930a20ccde8c802a02ecdcc5c78a5b [10/17] sched: psi: bpf hook to handle psi events
config: x86_64-randconfig-161-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290712.WBOvBoOQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505290712.WBOvBoOQ-lkp@intel.com/

smatch warnings:
kernel/sched/bpf_psi.c:130 bpf_psi_ops_reg() warn: passing zero to 'PTR_ERR'
kernel/sched/bpf_psi.c:155 bpf_psi_ops_reg() error: uninitialized symbol 'ret'.

vim +/PTR_ERR +130 kernel/sched/bpf_psi.c

343586cf71930a Roman Gushchin 2025-04-23  118  static int bpf_psi_ops_reg(void *kdata, struct bpf_link *link)
343586cf71930a Roman Gushchin 2025-04-23  119  {
343586cf71930a Roman Gushchin 2025-04-23  120  	struct bpf_psi_ops *ops = kdata;
343586cf71930a Roman Gushchin 2025-04-23  121  	struct cgroup *cgroup = NULL;
343586cf71930a Roman Gushchin 2025-04-23  122  	struct psi_group *group;
343586cf71930a Roman Gushchin 2025-04-23  123  	struct bpf_psi *bpf_psi;
343586cf71930a Roman Gushchin 2025-04-23  124  	struct psi_trigger *t;
343586cf71930a Roman Gushchin 2025-04-23  125  	int ret;
343586cf71930a Roman Gushchin 2025-04-23  126  
343586cf71930a Roman Gushchin 2025-04-23  127  	if (ops->cgroup_id) {
343586cf71930a Roman Gushchin 2025-04-23  128  		cgroup = cgroup_get_from_id(ops->cgroup_id);
343586cf71930a Roman Gushchin 2025-04-23  129  		if (IS_ERR_OR_NULL(cgroup))
343586cf71930a Roman Gushchin 2025-04-23 @130  			return PTR_ERR(cgroup);

cgroup_get_from_id() can't return NULL.  But if it did should that be
a return PTR_ERR(NULL) type success path?
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

343586cf71930a Roman Gushchin 2025-04-23  131  
343586cf71930a Roman Gushchin 2025-04-23  132  		group = cgroup_psi(cgroup);
343586cf71930a Roman Gushchin 2025-04-23  133  	} else {
343586cf71930a Roman Gushchin 2025-04-23  134  		group = &psi_system;
343586cf71930a Roman Gushchin 2025-04-23  135  	}
343586cf71930a Roman Gushchin 2025-04-23  136  
343586cf71930a Roman Gushchin 2025-04-23  137  	bpf_psi = bpf_psi_create(ops, ops->cgroup_id);
343586cf71930a Roman Gushchin 2025-04-23  138  	if (!bpf_psi) {
343586cf71930a Roman Gushchin 2025-04-23  139  		ret = -ENOMEM;
343586cf71930a Roman Gushchin 2025-04-23  140  		goto exit;
343586cf71930a Roman Gushchin 2025-04-23  141  	}
343586cf71930a Roman Gushchin 2025-04-23  142  
343586cf71930a Roman Gushchin 2025-04-23  143  	t = psi_trigger_create(group, "some 100000 1000000",
343586cf71930a Roman Gushchin 2025-04-23  144  			       PSI_MEM, true, NULL, bpf_psi);
343586cf71930a Roman Gushchin 2025-04-23  145  	if (IS_ERR_OR_NULL(t)) {
343586cf71930a Roman Gushchin 2025-04-23  146  		bpf_psi_free(bpf_psi);
343586cf71930a Roman Gushchin 2025-04-23  147  		ret = PTR_ERR(t);
343586cf71930a Roman Gushchin 2025-04-23  148  		goto exit;
343586cf71930a Roman Gushchin 2025-04-23  149  	}
343586cf71930a Roman Gushchin 2025-04-23  150  
343586cf71930a Roman Gushchin 2025-04-23  151  	ops->bpf_psi = bpf_psi;

ret is only initialized on failure.
Best to test with CONFIG_INIT_STACK_ALL_PATTERN=y

343586cf71930a Roman Gushchin 2025-04-23  152  exit:
343586cf71930a Roman Gushchin 2025-04-23  153  	if (cgroup)
343586cf71930a Roman Gushchin 2025-04-23  154  		cgroup_put(cgroup);
343586cf71930a Roman Gushchin 2025-04-23 @155  	return ret;
343586cf71930a Roman Gushchin 2025-04-23  156  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

