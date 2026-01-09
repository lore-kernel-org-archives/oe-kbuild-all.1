Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FAE334C1B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952631; cv=none; b=bPEdbeub9CmoroiiCKh4t5eg8O02JSVcde49mBSupx7noNPUTdLNbRlrGuhbKDvodf+42W9irUsFpS1H32F8NVju4eT22QWq6PhT/LiBNzLk99M6QdgmVeZEwcUrdbMvf9Xc6G3QYWW710lZnapghbehwdmcLDNNNpAtedfAoxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952631; c=relaxed/simple;
	bh=dz7KB5U3gx3viAJcCdLa2VPDIKl8SwY4jJYjy8LTtOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZQkSdcS9T8ydvagL2v5B7y2nVFAv/17cqJL/y+f0NCfpi8LnC1o7Rkc274NpIxd/mKj/LIYkynwv1tXUah5eO7iZK5lFj/gDvbGiht0cuxp5sPruseabitC5ZO0vE3+XvUi8p8cBNyrJaW7mjFRYmplWpH0SrKlJIA8gcP2G5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3RRot+7; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3RRot+7"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47774d3536dso25668755e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Jan 2026 01:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767952627; x=1768557427; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4RqShnqGsHgQYTVYTqto7aLrJkECk/U5MKTx+2e9Xsk=;
        b=B3RRot+7t3Tkcp0YGXGP9zQ/txw53SHgY3odBl22VFkUrjf7XcBHkaJXiemVEVhi01
         75y5ERmGrKM+zAN0o4k/NT83zHq5TGh8bnpZsAbPhKTYEbvkPb/9HGNT904Zp6rb+C4T
         ggn2+Lj107PbdRnQOE0GR2moHuYGOm+cjUzPnjpB+x1ydgi5notUwP6sC69UWRIy1hkP
         QRVodrK6wx16rvKqmTbDaaZ2UqoueF9Uv9VOf9KFaPQjUVn4+Zo3a01/9Mo/SZ+g6UVv
         DiBZ9ulpe5tfy5Xwh0UMblM3rboHtIv3ciSuRZ3KhkpTnSiPnrVP2LdEJ+XXEpPJjSgg
         9Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952627; x=1768557427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RqShnqGsHgQYTVYTqto7aLrJkECk/U5MKTx+2e9Xsk=;
        b=JPVIwSYbhnfs4X2FqFejNb8I/0g4DkK/DI57kJN2o+6a/3Gj74WEop07WZSsqubGlA
         41sOYZIT0f3hYo4IiwVv0+5frbBS6QndgFFKO+mEMkP5KIS8vBAyrs9sV+MYe6wzau16
         g+GLFNwU9tM4zBK4R7Gj0O7A7ND8g8AjIWoTiDzgcPtfIHT5hGo8Gi3w+XXs+yU/XxFc
         OdqxL75LVtbA6H2Z4MRKAiZSNTb/n4b/FTNtiesZ0bb/UNpxqJx+FmffOD3bbKDPwd3H
         cGTkvVLFDIDZ9butxQvPMCoaaMEslmJbXmGHngo2xkrl7yv9S+bUZPIOGa7nf7TPpzsK
         7eSg==
X-Forwarded-Encrypted: i=1; AJvYcCXvbJmAePojG4QZUjMvjsUsx1xqfYHcnv3tC8poC9qtjtBc8Y50jiG03Mj2Nn0dczX93Vgsf+tkn9KYnFAA@lists.linux.dev
X-Gm-Message-State: AOJu0YyPRy6y+vnSWrsUS6RPjzFWnMcHlFATWL4ZCpKsYCuIUbZpMxFs
	L/jd/fHtDhF3JCZFrLys0JD3mm5QDcOygaIkPNPslP4NHAxLcH0632FEs3y6S0YRGDk=
X-Gm-Gg: AY/fxX465ZyCGrjPSMr0tUbwtI+2H38e9fRa55BZq6rcEgtFcVzTZxQ1etixfLyetOo
	H4kZ6e9W4A8JB9AW9GN5VnrujanLXzfnkPT+Xn8XC7ZsOQpEb/r0Jzpx5wej9uwOv2bQvm9JprZ
	GSiehqw+PTVkotRNRXKJV3KoSPlpzRLjJ9InFNjgeZGRtabyicxgevP12gjqKTy/fWlHS/RDu4i
	NGOGwj7EAmGqZsRUBjcKhuuCLTM5tBvE2abBB3jrDgwqaYcbZeIsjOx1ExENMRE1C1FGeEcf3/S
	0aTapOrV4u757PJKWGZJCpTej0PofHWxO1P1W5L3TNJyDwTcaLde3QykfMj+mss+plQ+PtiHqEY
	g9Y5wA36HfmHAdR6+yFUBUbCLgnheItEstpf99YOSTigQYxhc8mQWF5hyT0fSj3Sz+J3xbhvtjA
	W3VD4n9WYX8fKzSSlVJ62PkmFylXY=
X-Google-Smtp-Source: AGHT+IHzh/pNeqZUBGaG4KiRPl2v7SR9G8ylIFzlUQ3MiO5GcK+In2/wGNHZw3ijn2CU17RqJrvdWQ==
X-Received: by 2002:a05:600c:6308:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-47d8486d60dmr81639985e9.9.1767952626449;
        Fri, 09 Jan 2026 01:57:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm211143335e9.1.2026.01.09.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:57:06 -0800 (PST)
Date: Fri, 9 Jan 2026 12:57:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.filename 15/59] fs/namei.c:160 getname_long() warn:
 the 'EMBEDDED_NAME_MAX' macro might need parens
Message-ID: <202601091728.qaU51LaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.filename
head:   30ba070760d3eb039c6eb91ad17d8c1e13335a7b
commit: 2a0db5f7653b3576c430f8821654f365aaa7f178 [15/59] struct filename: saner handling of long names
config: powerpc64-randconfig-r071-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091728.qaU51LaE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601091728.qaU51LaE-lkp@intel.com/

New smatch warnings:
fs/namei.c:160 getname_long() warn: the 'EMBEDDED_NAME_MAX' macro might need parens

vim +/EMBEDDED_NAME_MAX +160 fs/namei.c

2a0db5f7653b35 Al Viro       2025-11-19  152  static int getname_long(struct filename *name, const char __user *filename)
b8000a3628d80e Al Viro       2025-11-19  153  {
b8000a3628d80e Al Viro       2025-11-19  154  	int len;
2a0db5f7653b35 Al Viro       2025-11-19  155  	char *p __free(kfree) = kmalloc(PATH_MAX, GFP_KERNEL);
b8000a3628d80e Al Viro       2025-11-19  156  	if (unlikely(!p))
2a0db5f7653b35 Al Viro       2025-11-19  157  		return -ENOMEM;
b8000a3628d80e Al Viro       2025-11-19  158  
2a0db5f7653b35 Al Viro       2025-11-19  159  	memcpy(p, &name->iname, EMBEDDED_NAME_MAX);
2a0db5f7653b35 Al Viro       2025-11-19 @160  	len = strncpy_from_user(p + EMBEDDED_NAME_MAX,

It's harmless, but the "p + 192" happens before the
"- sizeof(struct __filename_head)".

b8000a3628d80e Al Viro       2025-11-19  161  				filename + EMBEDDED_NAME_MAX,
b8000a3628d80e Al Viro       2025-11-19  162  				PATH_MAX - EMBEDDED_NAME_MAX);
b8000a3628d80e Al Viro       2025-11-19  163  	if (unlikely(len < 0))
2a0db5f7653b35 Al Viro       2025-11-19  164  		return len;
b8000a3628d80e Al Viro       2025-11-19  165  	if (unlikely(len == PATH_MAX - EMBEDDED_NAME_MAX))
2a0db5f7653b35 Al Viro       2025-11-19  166  		return -ENAMETOOLONG;
2a0db5f7653b35 Al Viro       2025-11-19  167  	name->name = no_free_ptr(p);
2a0db5f7653b35 Al Viro       2025-11-19  168  	return 0;
b8000a3628d80e Al Viro       2025-11-19  169  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

