Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122711;
	b=AuDheTDRhXT2+LQ7l+kOSkaUXc0pVOhQcmMftSgWGIalza4xhea+HWyqakWqG72/HweC
	 qWk7pjbH4/tU9FWqXw5kRFmb0X8ZFlpeSzUmKZq975U6ONldg+pMrYmt3NC6Dk8GdeLth
	 039qh+p0ZHENmBda1wCMyfsrNtRS4fnVUGucRk9ykBpMsykVaMfYAS7ybdVFgNHEMqL/B
	 GGeMTccuMqt26Vel7eLNNAj6FSHw6pFKVe9chkSpYfEophOFKzjiKddJ8PBSadLFwX18n
	 SRSqooCcueD5S91DCbKsXn2HWs07gIXlRrDl/42MA4BD0Wapi4SV9IOsf1p5BQgjxig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
	b=vhmGAS5nKYkKIvZobvOKtD6qXNNLndrJkI6E1GdY7YZEAz0hv0u5j8KkK4QM0PpKuvef
	 DNLo4LxPHSS2W55uoOUD2LrQe2v2aUmF7IrRcXYXT68ZhwgKIVLFMJnQB+Dj8I+ocwVPJ
	 am7e5+2Sq3tFHQi49e8tsz9XNJ82ID9jdyTMXIDq1pHI4sDrUM9Wrc3D3PqRFMKfv4e35
	 8cNRg8AyN9ziX+C5gRJAk2BJoMKU+r6dH7O2lyekcvgr4FOyEuwkPNzufHraDImIdyRbe
	 KVjROFBU2tPMgHJ6gBC0iJuUrMbR2uNfcxAKtKHeF3k8EDRXCxnVagHK088i+B6jgoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOpHkYDe;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F40606A321
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 07:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97F40606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOpHkYDe
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37198ed3727so13135eec.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 07 Nov 2026 23:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122710; x=1794727510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
        b=fOpHkYDevv5PxomVINfC0kzmv186NYq0aRidpz5hyoVGLPQQDFnep0cuv6FVxGj+gp
         07gzaGuSmEJtZFs6t0t5YtdmFopbD87EbvDXxTz1GXk9ly8rF3k7hNUP4JE4Y+PtfoO3
         X+LNG8GwCtz4VUe2nF8WCTFSWZUzgs96Za/EYkiS4zMeSDR3FDsAdg+x3y9sggbnmRqC
         U4mjVy1eixVAVU+wz5JKWgHfaDrhj0NcFVtSBD88KBmmr5CXmPfsK2ym0/Yl11N3eoh4
         fng+vi87rz4BT74U6YpZ8POMZ4WqDcl/F/U70musSxlj4cu8oN1RiJV6fHNJIHyiibwj
         35uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122710; x=1794727510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
        b=CNtG9W6Ft7Oym7l2s+izv/M+Imz2OVOguDUCOxnSJUwsfiIVdEzi+32I8J0iwU3DQe
         lUhk5GC5SC6d7B5i3SrekKMSkRNsPyXubP6vurNkceVIp0Bmz76O29kopUZPWH5OjkHg
         UyxSfEoVQrNKE4oOgpeXd/YDSrHC4rBmAGvMpl4A5UqWPTpaIK24qFn8hSkK83Cxurpq
         E0ohQw/MDGe+/DtXJN2BXO5EDGRnhSauyHHhChE80Byc+nTqlB33tY5Iqu+EAokQd7Mv
         5rhZ8EsJeSpsUakYANs+bE3NSzVkAdXxas4Wc0Vx5gNnV8ZYIVcW+bllNF3a+OpUqivk
         tjOg==
X-Forwarded-Encrypted: i=1; AL+hErE9FMxnaN0Gc12rj2aAaN15j/SKHboPJCVzLAfchwnlPj5RbcLTji18SiD2WtTkc2tVR98fqooRF7vjbb4K@lists.linux.dev
X-Gm-Message-State: APuU4Z/rg/JyxghtycLZZDxfEt02utmgS5IikpZtjjqWinTiDdZavca5
	0f6gBL9Agn2dzPX50cekprS+n4bz3A0668O0h/fcNU0YBj63md11miw6
X-Gm-Gg: AYBFou3WLuK0ycmgrmEHrRhN0AUrfhMA6gZJniHjT279+UueMiOc3f5sY7vsEGjvmwk
	R24XONmGctzX/kbVKo9Tg/9dflg+nwnDsKT3J07swfALxc1y5VRy8oVI0l5NBdnFK/05AGNKrb1
	D28owEAJ0aT9TcahsIl74qLYvG+HB0mOTokJXm6KUx5BM5O1oZ8QJVXDy1GHYdS3/PcYYIioliB
	36izpyAtvbOnV31A1yi0YDVgJ9A0J5NAooKnakHQRUceAJxN0Onl5PZ/p8XicSb8+5mfQg27Ake
	lHXP+xR3d8DKvoeDrtQKJXbXUgdDqQn4+WJ0e6cgrIy2+NGMOSAD9NSVq8k1k0OzYNlpvr5NuTA
	aYQbf6IsQx0cTNv9NKKQMP4mwizrVx7HLJ+agnvVmSncTjvnToeQxnjAJRwqduQ6HNrxppo+l4J
	5FgQVLIHtkhIVwdROD9H+8YctdDuyGdptfU5m7sNMbUMeWmpQuH2BolT0Y751q0/IFJiQWccSD3
	aCCCTovTyeYFlFJajGJtAQ5f/hmfBcy1YdOn5asDmcdzxDtaJYx/HbYkU39p1HZV1UVtR3Cwvfu
	gZLVBCwYPG4qYetuCFTWUbxcuYldybWtVyXddrLjW6epNMAvMiHAKbEG1ToZckc3t3eIOA==
X-Received: by 2002:a05:7301:1a11:b0:368:2c6d:ddfe with SMTP id 5a478bee46e88-370f6115a74mr6028007eec.9.1794122709628;
        Sat, 07 Nov 2026 23:25:09 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:5213:762b:b24:1be1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm3499775eec.12.2026.11.07.23.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:25:08 -0800 (PST)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: lkp@intel.com
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	oe-kbuild-all@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [PATCH v8 2/5] tracing: Use the stackmap from the ftrace stack recording path
Date: Sun,  8 Nov 2026 15:24:48 +0800
Message-Id: <20261108072448.990755-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202611080654.sqFxIlwl-lkp@intel.com>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-3-lipengfei28@xiaomi.com> <202611080654.sqFxIlwl-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 08 Nov 2026 06:35:01 +0800, kernel test robot wrote:
> kernel/trace/trace.c: In function 'record_stackmap':
> include/linux/rcupdate.h:502:9: error: dereferencing pointer to incomplete type 'struct ftrace_stackmap'

struct ftrace_stackmap is only defined in trace_stackmap.c, and GCC
before 10 rejects typeof(*p) on the incomplete type in
rcu_dereference_sched(). I reproduced it with GCC 8.5.

v9 will move the rcu_dereference_sched() into
ftrace_stackmap_get_cookie(), which will take the trace_array instead
of the map.

-- Pengfei
