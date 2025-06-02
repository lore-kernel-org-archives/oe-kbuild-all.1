Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296DD1993A3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 06:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845219; cv=none; b=ZzadsT3eDff5NFoxlUVDE/AKTKjtDjg2BIt9zAPodlnbPcHh+fKqGm6FegHNBitxol/cRDgsMrk/AvG+etGaIjf+INw4onYxWuCphRQ1wRX/801T3kjwl/1NN7vPRjUcZHVO3QgnCuguMDlBC9Hc3SjBzsuLbjoj6yrbYus0Fls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845219; c=relaxed/simple;
	bh=uqhiVvUTjJUz12WNnC5vQ4AYx38ysdEHyQ+YwgWYwRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ic5Ghzok8rsRJzIKYlDD1CUIIyB7u0mH57yjOSME2hluaZQ+jhtTiMW65izqqlWuAIIWWZFtx8OGJFRNLmb4JWbSvbpAJFWvDyfUJalAcV1DYLp8ZsI8EMfkRs9DPeUsB/tqHc5OQuW1lY55xzRUEw9VBA9LZwC0zdwsrtoHzYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XEBfCz0L; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEBfCz0L"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so5402245e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Jun 2025 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748845215; x=1749450015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tOEMUoWDeDY5mzeOr4SEl8dbwxhrqozXvwOKEHtHeUk=;
        b=XEBfCz0LJYhjP/5kOGahvURO7gsEdGdnFSAJnYs91m0xuxqZqFAveKRRP6MMcEIo5N
         sh69oJf2A/zPpNrPDZKDWH1a6zMWLfIaLYnlYBUhtRwk3rc4gl/UN6V8vwXRSjHK2vOR
         HmOOK4N0NOzLQIcgGze79Lvn2C+jVVo+MpU7+IlH4fJytiISjes+Dl6gnAzsmIgW+uZm
         nK9HG/WgWSagtb2DZiFB3sehPKjk/7C1Gsa62XNCI1iwwima/p5/4b2eq+jG+wjvvVVd
         3O2TI6egMxdTiIzq42Zs9JbXHfn0oqTVTJ7sp/vLbrmpm4zhpzSmZ6bgfNktgxfDz+s4
         X6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845215; x=1749450015;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOEMUoWDeDY5mzeOr4SEl8dbwxhrqozXvwOKEHtHeUk=;
        b=J0QexNtO2MFHgi/jZt7bqaG/fWOBnTUbdcHqfLgZmFaYCEvm0CALSInq8YiZP5x438
         HZN5L4WxeBjsqu0pIe6WB6GTGeRlwUEITlZ+qdjtCe4rz2lg6pPgysgomKWFqjhgNw4S
         pxTK7X8BPvsfAlwF+TvDxHxNGPRBwewwjZS1sXQ3PgqGE9810TpbZIxA+SQDzCRSG4NQ
         yHD1YfgDMa2TYAPwGj7TwKboGLGi0Ai2i57GEsGulKW9EjdXlElaA63RIyPtASFHUO9P
         0SSqbp4H+/KP6AgcJpVxMYO3rGFImciL7yqdaIe0SixXUpLSB+tyQCEEiHXReA4nVHaM
         1ubw==
X-Forwarded-Encrypted: i=1; AJvYcCWW4bfaqtETIEOp4fy/TZUNs1RfBLjCHrohKnSUsTEjiyiiqfWHQ7qC2E9pVnJcyORjMWAtMDmitn99uAdW@lists.linux.dev
X-Gm-Message-State: AOJu0YwpCGjEoJUEFHnVpdnvzzWXVjpmXPXu/kdFFEB1y5HtTUuROUuR
	0Vzqe51nLvQbtD2GrvC+InBlKJjAqg8iEM82mBOboU5mSV/lhk3r0L6Lwc02EzS8PUE=
X-Gm-Gg: ASbGncuSgWMJSYNvdvaYkEL1eAgT5mAeMFdrCVsESFvnBZpy9HMTalDXwbQtqDmPOrf
	yRBMgwe3TV/tsD3mWOjMSM8uGmh1PyVejrC/W0N0f5uqnj9zJYdD7GD+UZZdIP5tCqmexUU6jG8
	+/S5r7UGdMW/ONrno+TYHJzpJpr5J8GZB95Z0fsXqqEJjsuWFVyKdd7K5xmHR3nPym3xmUd2HOx
	V6Ve0Z1VfQAbwAgd2Gg+kG4kaINVZSj+S4nXCNCMjktpodgweXrKekj67vnGhiA25QePZZDk0v+
	u9pUjcVL/Ue+79cxwS4c8Ki5t8uxGjBxZ9of+/3lKKlMoznRts9VvgQ=
X-Google-Smtp-Source: AGHT+IEhg9lSTzexUaVbkdcQrdyWsGg7a4BXZ1AHF91UKUvvwVHEH4xwEI9JAg73XATTsIBgax4M7A==
X-Received: by 2002:a05:600c:4f05:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-4511ee13fb8mr65790875e9.18.1748845215311;
        Sun, 01 Jun 2025 23:20:15 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fa24c6sm108973155e9.12.2025.06.01.23.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:20:14 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:20:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rong Tao <rtoax@foxmail.com>, ast@kernel.org,
	daniel@iogearbox.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, rtoax@foxmail.com,
	rongtao@cestc.cn, Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Juntong Deng <juntong.deng@outlook.com>,
	Amery Hung <amery.hung@bytedance.com>,
	Dave Marchevsky <davemarchevsky@fb.com>,
	Hou Tao <houtao1@huawei.com>,
	"(open list:BPF (Safe Dynamic Programs and Tools))" <bpf@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpf: Add bpf_task_cwd_from_pid() kfunc
Message-ID: <202505300432.nZC50gOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_97F8B56B340F51DB604B482FEBF012460505@qq.com>

Hi Rong,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Tao/selftests-bpf-Add-selftests-for-bpf_task_cwd_from_pid/20250529-113933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/tencent_97F8B56B340F51DB604B482FEBF012460505%40qq.com
patch subject: [PATCH bpf-next 1/2] bpf: Add bpf_task_cwd_from_pid() kfunc
config: x86_64-randconfig-161-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300432.nZC50gOu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505300432.nZC50gOu-lkp@intel.com/

smatch warnings:
kernel/bpf/helpers.c:2687 bpf_task_cwd_from_pid() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +2687 kernel/bpf/helpers.c

b24383bde5a454 Rong Tao     2025-05-29  2657  __bpf_kfunc int bpf_task_cwd_from_pid(s32 pid, char *buf, u32 buf_len)
b24383bde5a454 Rong Tao     2025-05-29  2658  {
b24383bde5a454 Rong Tao     2025-05-29  2659  	struct path pwd;
b24383bde5a454 Rong Tao     2025-05-29  2660  	char kpath[256], *path;
b24383bde5a454 Rong Tao     2025-05-29  2661  	struct task_struct *task;
b24383bde5a454 Rong Tao     2025-05-29  2662  
b24383bde5a454 Rong Tao     2025-05-29  2663  	if (!buf || buf_len == 0)
b24383bde5a454 Rong Tao     2025-05-29  2664  		return -EINVAL;
b24383bde5a454 Rong Tao     2025-05-29  2665  
b24383bde5a454 Rong Tao     2025-05-29  2666  	rcu_read_lock();
b24383bde5a454 Rong Tao     2025-05-29  2667  	task = pid_task(find_vpid(pid), PIDTYPE_PID);
b24383bde5a454 Rong Tao     2025-05-29  2668  	if (!task) {
b24383bde5a454 Rong Tao     2025-05-29  2669  		rcu_read_unlock();
b24383bde5a454 Rong Tao     2025-05-29  2670  		return -ESRCH;
b24383bde5a454 Rong Tao     2025-05-29  2671  	}
b24383bde5a454 Rong Tao     2025-05-29  2672  	task_lock(task);
b24383bde5a454 Rong Tao     2025-05-29  2673  	if (!task->fs) {
b24383bde5a454 Rong Tao     2025-05-29  2674  		task_unlock(task);
b24383bde5a454 Rong Tao     2025-05-29  2675  		return -ENOENT;

rcu_read_unlock();

b24383bde5a454 Rong Tao     2025-05-29  2676  	}
b24383bde5a454 Rong Tao     2025-05-29  2677  	get_fs_pwd(task->fs, &pwd);
b24383bde5a454 Rong Tao     2025-05-29  2678  	task_unlock(task);
b24383bde5a454 Rong Tao     2025-05-29  2679  	rcu_read_unlock();
b24383bde5a454 Rong Tao     2025-05-29  2680  
b24383bde5a454 Rong Tao     2025-05-29  2681  	path = d_path(&pwd, kpath, sizeof(kpath));
b24383bde5a454 Rong Tao     2025-05-29  2682  	path_put(&pwd);
b24383bde5a454 Rong Tao     2025-05-29  2683  	if (IS_ERR(path))
b24383bde5a454 Rong Tao     2025-05-29  2684  		return PTR_ERR(path);
b24383bde5a454 Rong Tao     2025-05-29  2685  
b24383bde5a454 Rong Tao     2025-05-29  2686  	strncpy(buf, path, buf_len);
b24383bde5a454 Rong Tao     2025-05-29 @2687  	return 0;
b24383bde5a454 Rong Tao     2025-05-29  2688  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

