Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57612C08AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755503828; cv=none; b=Yv6lmw7mUX++brWOg232k9zxCTgAcgNqTFRSxfkIttXyAUmxmNAWb+qldp0hxSOWZzpi0x+pcz+eMwJmZ+Zvd+/mXGO8EVuXHkkYbQd+PTh/b403yXyX+kBFHbkFzgIeASzjR56jHJk6ap35j9X2hX77txZauXdRC8M0riaO940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755503828; c=relaxed/simple;
	bh=irkUYFM4/paMAk6Wy0dyId7dBz+H2TNcYXRcWrpe4Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KtfPogzuuJ1KfYTmUrbwIsRTZw1zDMXPyNc0m0KkFfZFpsfXmWVkOEG54N8nFvKdqo94RFECr1zlS18DsCWmvD8m3mSZSq4g/SHP7DW9fF746KClVxBpjuX4fAwmBNV8WDErMnOYJzCs8Md56OJRzddlXUVsTyFI303agisdm28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+pteSrs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+pteSrs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0d231eso20432085e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755503825; x=1756108625; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5JGOjRrEBDm9X/sEa4+YcCwfIvA42r2B08SfP6T1iQ=;
        b=U+pteSrsRikvEGUvL3oj95UnNx4ElOFv1xkQ9QHV+WynQocJ819auKq2wubJenw6Ok
         AX3jB/jS4Bo4W59FvoUHyGbS3XRlPysnLkExrBexTUaaErtH8gGfjqJc7tJvZGLBnUOz
         hsC7JG7A9wr1oU38RWbDUUr473iMVKB4AYKkYm78CZolDehqSe/uhaUg2VVjJ7BUFKcS
         RYUt36CTmX+GN1I3UoGhN4dXkWy5p0L+XKP+S29W5JBLZXLVOnUfw1eAxfjemm8mKVP5
         lovy3icOL4H7SGU/XkWl4eVmDn0yms/DGoDxfkQ5jqZsM9hz8owfR22pKEhW4re0yTwl
         BwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503825; x=1756108625;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5JGOjRrEBDm9X/sEa4+YcCwfIvA42r2B08SfP6T1iQ=;
        b=ZCe83lVq1rbTwY1kbqq+lf9INqWRD0dr6qTH/JVqAF/JIBAmm+uFRvotJm8A5nJZC4
         OnFl2/CK1LSNdceYWj3fNMVJm4+S1RyFiLL7W1aJAz1meKym28Q/KyKddJUNwk4fkAF4
         RShKhXVtCUoeySSw+PNhztG/uOIXJ54H47JTTeViiZ+sLJZx/QUkP8/dZokzgJvqELaB
         TjvggGJdw/SR/zkzN0a+reKcKhdzoPTIB6ZvUsu4BwkKaNG/oAzyMfR3rSmTMo1sKPCB
         z6zXkP2Ht5KI8TgWenLc7HqpVYMmrg9zbgIv8DpglFTG4+NAs5wuLJiGow1SRkeICBS6
         tXVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBeTJm5qb1+lBypN/XXs8ZkdWr9o9ob5dWho1/X0beoMyNz3QxwI8L95We39T0NVPbZinPD02mCUzvGeEd@lists.linux.dev
X-Gm-Message-State: AOJu0YyMBy79DPS0givECT0uz88efst1KOlvF+JNtRlrl/d5japgMbXL
	Bmr6/YRWh+uisjqQliXplbfP3C7x0yoi/LcKGISMlZxyo8xV+qtgALGZ5iZUInDdPag=
X-Gm-Gg: ASbGnctlGqys4WbPK5IAjFnHz1HysW5gadGrGxoRBwM7JqYbSCAB3m+tIuqeY+uka4i
	GDcOzaHtj8O0uglDh+9Ars2ydxxoopeZ3iJT0vt4FiaxIMR3/IswjO9Xh1IXWmffOpVjcjyRzhO
	BHo8iLcxReyrCTaGQSfHuuX6oDXwMtRN1A7Q/fuDXMikcdmoAkmK2vLFlfkyhc1BjgsP3AcvfHF
	2Uaiqr3SJ5CRkLP/UV4SSASuOfa0GJHF3VMw6Db9R5sxhm3dZ3+IJ8RNPACC0B2Brc95WrA8SSo
	uS0ngYcypjtTsM9MLjyK5Hh0ZIhiYT0XgUL7Rt591n/NV358MT2zlf4rD1YQYKmMh97Li02T327
	6799qLOFQCCWJz2vNwQW2DLhJg5k=
X-Google-Smtp-Source: AGHT+IHrJBk4bWXGj1nwyV4v635UJ8iUxXiG9MG7O5UHiJQO4NEljj+USKB+JTzmq9N/S2OxSSJhng==
X-Received: by 2002:a05:600c:19d2:b0:459:db5a:b0b9 with SMTP id 5b1f17b1804b1-45a218582f8mr64812345e9.28.1755503825202;
        Mon, 18 Aug 2025 00:57:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bc5aba02e2sm9484162f8f.3.2025.08.18.00.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 00:57:04 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:57:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anton Protopopov <a.s.protopopov@gmail.com>,
	bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Anton Protopopov <aspsk@isovalent.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 bpf-next 08/11] bpf, x86: add support for indirect
 jumps
Message-ID: <202508180805.aUCPtTuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816180631.952085-9-a.s.protopopov@gmail.com>

Hi Anton,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf-fix-the-return-value-of-push_stack/20250817-020411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250816180631.952085-9-a.s.protopopov%40gmail.com
patch subject: [PATCH v1 bpf-next 08/11] bpf, x86: add support for indirect jumps
config: x86_64-randconfig-161-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180805.aUCPtTuQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508180805.aUCPtTuQ-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:25013 compute_scc() warn: unsigned 'succ_cnt' is never less than zero.

vim +/w +25013 kernel/bpf/verifier.c
 24891  static int compute_scc(struct bpf_verifier_env *env)
 24892  {
 24893          const u32 NOT_ON_STACK = U32_MAX;
 24894  
 24895          struct bpf_insn_aux_data *aux = env->insn_aux_data;
 24896          const u32 insn_cnt = env->prog->len;
 24897          int stack_sz, dfs_sz, err = 0;
 24898          u32 *stack, *pre, *low, *dfs;
 24899          u32 succ_cnt, i, j, t, w;
                ^^^^^^^^^^^^

 24900          u32 next_preorder_num;
 24901          u32 next_scc_id;
 24902          bool assign_scc;
 24903  
 24904          next_preorder_num = 1;
 24905          next_scc_id = 1;
 24906          /*

[ snip ]

 25008                                  next_preorder_num++;
 25009                                  stack[stack_sz++] = w;
 25010                          }
 25011                          /* Visit 'w' successors */
 25012                          succ_cnt = insn_successors(env, env->prog, w, &succ);
 25013                          if (succ_cnt < 0) {
                                    ^^^^^^^^^^^^
unsigned can't be negative.

 25014                                  err = succ_cnt;
 25015                                  goto exit;
 25016  
 25017                          }
 25018                          for (j = 0; j < succ_cnt; ++j) {
 25019                                  if (pre[succ[j]]) {
 25020                                          low[w] = min(low[w], low[succ[j]]);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

