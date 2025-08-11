Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161EE1990D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 06:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754895291; cv=none; b=SgNjVr17Sa6Hbu0P0lVdXO7ecSjoAZOIrA28Py4BrG47vXqv1w41bOQ6RADpBdG5HmgwlCBArkJ1kFTMpNdrazqHk6FDHRAYN+XsYyVpl4oQP8j7ZLCNdGSigFPLWRtTEUvanti8fvPcgXXEBPxFLJfCvxfN/TcDh5OmvNDvorA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754895291; c=relaxed/simple;
	bh=vpan0JthTnm9mMWryRuPn1J0rq4yxee0NmCrVQudEKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N+x90LIhGk6bJ1JQYP1bISDOKAulLOm/RZKUwuyDkgO4AJ5wEWzn9v52RNoquDJeJm/bYUUVkeibmmyNr9o519m/qaYUn6kePxo2gQcGiAb9JtjrmtkgxVoTnAu84VuNjvGo1NQR2JuxdFjIrhh6PeHLFDVK65pdGpdOo4uUG6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCWJSIct; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCWJSIct"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-459e794b331so23763305e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754895288; x=1755500088; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRg4ECWVFjK8LcuEJ8Vr0rtSwbgMKKllRJWglkkyFkM=;
        b=nCWJSIcthYBepPYhcIvKR0xclfX9OWjZMxkGuTpjOZdFhOUMQHxy/mOdcWLShah+WW
         xSGCE8BmR389I8AO4Lv5BKN0rOOffQa059NROtCioIOdssgxGuYe2bd6+wLq44+91We5
         QSK9ezteW3YoRIGX6kshEnWr19UmPY0/e5OKDTnJhaCWa0bBf/n1X8xxvXPXE6lzPoqM
         5//DVUV9XbkBD3dJx/cp+hIUh0pzETejbUrmR6uf9PY+eimU4a7U++vy4qc7wxunXyg9
         86UGNLgpfv9VDajDnuGntcthdwdPxMToUwXYatAwahFSYpRfU+FSySwLUJzJ6zRpLaEV
         vROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754895288; x=1755500088;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRg4ECWVFjK8LcuEJ8Vr0rtSwbgMKKllRJWglkkyFkM=;
        b=rDqLzjAvIi8rXehcsgVtQLTu7iZ0V3jJdF1mwW0Y0/j6GJ4LP9KrHg6Cs4g7dvuuRb
         nlJdWGL3YUNVWHn92UjL4sy32vqJl5lYx5pdRATvF5qziciiaKcPt6Zyatg+VmYJpgcL
         oU7FC+L81urdjpcUyHAQLIVDdyxBQwL2LYTegdRzWEFAyTqZzHjj1MwyEMBPpRjoaMpO
         i0JKvCy47oCITjSAehDo2jfI+aQqR/3nI16fpYakST7UZ1midkC0nq3+ulOSrVbm1+qw
         NCaUyClWR8r2WabDZ8roKCoNZlGEDgQiNl7QdwZtXaJ3UAISxNJoK0ECDeu6xQtCgeP6
         RmiA==
X-Forwarded-Encrypted: i=1; AJvYcCWYrFtbxqkDssdmo6Cu90p+6A2yf5XnkUazEVmEKY3/zPbSip4MUNelbrDZCQE2lsWRHrhfD4O5z145BouB@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo6nFWjynkdPoQZT73zQ8g6nb+VmZM55IdCqZqtwCzPIVwiKAy
	m8e/LMnGmaIkZ+uZXvnoMn05NOJ9mUWGtlFsdVEjioPbWQ0Do+/eNPhoD1srpT847Io=
X-Gm-Gg: ASbGnctRQcm6nLsldMI/TlpeMNYQ+uw3IFq8See6vQsTqHY9VjGOu3z4AF6FQ1kysCk
	k7X7fp8Vxyn6l0nFLkMIsCTgaNKPZ0Tm9EmOA1EBCP1qjXVKnR+3punzPRyTv9xOI/BMapZ5Jmu
	ICYovOmlbM04RoZoheGGaGM/aTTOhlK10iknSA49hly+nd/Io/IBXTDgmEHGVK8gawI+3mlLetm
	egGHB03k5W5Kptl3LVH2yQ7bULAwgepeiDXqz1VojMvWN1FxhxO+4y024SHFyY6ZtLo2TJWEPKL
	jYDQHPocsWiTUqqwvpT5TKpV02x0AU+iuvA9fi/oLOAkPv/2HOhL2yYYolG6x0RtVRWJJ1l/L53
	MrDMsbyjE1KuDCdhzRCwnKpLs6VA=
X-Google-Smtp-Source: AGHT+IG3SqO2Qik7FdIB5WF8YVgndGz4JNEpr9I0JIpWaEib2bZAJNzXiM7YSQ0kSM/AAtFegUxj3w==
X-Received: by 2002:a05:600c:46cb:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-459f4f3b207mr87321215e9.29.1754895288423;
        Sun, 10 Aug 2025 23:54:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b8f5d7deaasm18603241f8f.65.2025.08.10.23.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:54:47 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:54:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.6 14/15] kernel/sched/bpf_psi.c:185
 bpf_psi_create_trigger() warn: curly braces intended?
Message-ID: <202508100933.hE8ICkP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.6
head:   4449fabc436d3de0b6d9ba42227e052e65bbcc97
commit: f3c5ff34789daf7f90c525e674e45059048b10d0 [14/15] sched: psi: implement bpf_psi_create_trigger() kfunc
config: openrisc-randconfig-r071-20250810 (https://download.01.org/0day-ci/archive/20250810/202508100933.hE8ICkP7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508100933.hE8ICkP7-lkp@intel.com/

smatch warnings:
kernel/sched/bpf_psi.c:197 bpf_psi_create_trigger() warn: passing zero to 'PTR_ERR'

vim +185 kernel/sched/bpf_psi.c

f3c5ff34789daf Roman Gushchin 2025-08-06  188  	params.bpf_psi = bpf_psi;
f3c5ff34789daf Roman Gushchin 2025-08-06  189  	params.privileged = capable(CAP_SYS_RESOURCE);
f3c5ff34789daf Roman Gushchin 2025-08-06  190  	params.res = res;
f3c5ff34789daf Roman Gushchin 2025-08-06  191  	params.full = full;
f3c5ff34789daf Roman Gushchin 2025-08-06  192  	params.threshold_us = threshold_us;
f3c5ff34789daf Roman Gushchin 2025-08-06  193  	params.window_us = window_us;
f3c5ff34789daf Roman Gushchin 2025-08-06  194  
f3c5ff34789daf Roman Gushchin 2025-08-06  195  	t = psi_trigger_create(group, &params);
f3c5ff34789daf Roman Gushchin 2025-08-06  196  	if (IS_ERR_OR_NULL(t))

PTR_ERR(NULL) is success.  This should just be if (IS_ERR(t)).
psi_trigger_create() can only return error pointers.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

f3c5ff34789daf Roman Gushchin 2025-08-06 @197  		ret = PTR_ERR(t);
f3c5ff34789daf Roman Gushchin 2025-08-06  198  	else
f3c5ff34789daf Roman Gushchin 2025-08-06  199  		t->cgroup_id = cgroup_id;
f3c5ff34789daf Roman Gushchin 2025-08-06  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

