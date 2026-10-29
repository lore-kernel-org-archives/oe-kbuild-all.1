Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262005;
	b=Umqr8x9s5eufMKTpR7zZp+JHyysxa8UnaAVGIB+JLI/2QxI/+Ziv2WPH5rBZVaMu7zvw
	 SQDQEU9J2fenzGHYA7h51jBWALIwbVJ+BShuI7g1ta6WMcBbNuLnWDjk3IpbSJdaiAWeT
	 POZLx3newancdOW7G02Hu7EJrdanUx2zxp+zE1De7tSkvVTVmrzPVI7VmDxr7luuEZVbo
	 HVRDGDL1kasFqdu93NZ+05sDKPrSbXxD25G98JOX5NMxHcRLgHKYEmea6nlWRHlp71vqw
	 6PoQcnYSV/ft19TpxbY0fXHj7R2biU2xTvQZSk4IoWK+VwnNDEVmJHAHvAqH63BDU9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding;
	bh=YD6yeEZzcF/IkGgi5XaflAkW3DzRMMEsfh8rp3u6CHE=;
	b=KvDNW7XPnfbygSbcgqZwnpS3KS/pDikPFt+0gjix1Hh7QCMxTNw+rN5T472gW9Vtpu+9
	 k3JQn9hBnr6ZcGQsCHvez5/ibkLRgbfTwM1ltfakY8w8XW1e/mmrMeF6T3ZpQUILoACGO
	 w67Q1xQRiXe/BXAFSYNG/XHV4Ey/8P5ovdDdwxTsZVcVR0B5DN0xVvYCiteKjOwfKc24b
	 I2Nn9vxnH11WxEaJVgXK5S2AcT3F21DjrciMgtQRHqOh8v7HocMY6Yi1A1X9FFmqGtMWG
	 gd45bjNjfEYPPbLiP1o7WLec1b9YFtL4G92pgokFHmqtG4eGE7M8KkwENTd/wY9TU1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCnJ1pcc;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03100606A322
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 08:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03100606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCnJ1pcc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so8917385e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262003; x=1793866803; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YD6yeEZzcF/IkGgi5XaflAkW3DzRMMEsfh8rp3u6CHE=;
        b=PCnJ1pccJPrNZHAEk9s+qGaQ4ncifZgd8N/H72uPLizsTOfszhsJgpKIMv5W6DTZdu
         txcRPJgvhx7ohQinKJWyLJmB7zC55VJ21Hg+KWsxLuXs0UwdOOcTY+rp9ah/TGiUUFKb
         rIY9HE1SmBY65qitSvOeDUtlUwpc6eIqtXjfeLmXowCYr8SBZvLh4zGMixYzVEhnXkAn
         IRNGAw1V339K4EfV2dSoI+GfUoNfUvoxgfRlUEzpIYS5CqyKLb7TSuDOsLvzB4F2uws6
         snCDxUyEXltOJzsozh5urLI6V2wmI+gBPhqqHyDyAg007fpBLIJFjSPEgvvDG2prn2df
         QUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262003; x=1793866803;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YD6yeEZzcF/IkGgi5XaflAkW3DzRMMEsfh8rp3u6CHE=;
        b=q0sEvsedcFJ1Be9z2ffAPj9c7pjLjh0XlLznnLvEIU37eGDkwrFkWYYsFaL00JD7Kd
         0Rq2WPoWrQwMjbImRxQIqeAWcPSvOHxXc0YeyY0d1v5JaFSxVR45fIF56/zstWMJW3Xw
         EX7RpEd3NOBZBgxxT0bZYXAAtJffv7AXiiLWyOGRVRGbyhh43v6Xf/6dCniGzu3wy2/b
         xAJFhzOUtA8MCjy4StTua3K3ufGXwLhi4FtHMk+9XNOvrrdWTXlxaqsDhGdWff15sfoe
         zyme0Z1muZQwYYZ7smShvCGRrchL3f5mnqOCWhTVQptPEvXULhHahzf1aU4+/5iWbyJ0
         eFJw==
X-Forwarded-Encrypted: i=1; AKwUvBxOcHFOO9PrybvQ8f5OucJ/QuBo4bMRucdJNggqlO2rQP5ikFvRRP3HbWJKKOyKMidHJj1vTVSwwi6eBGXc@lists.linux.dev
X-Gm-Message-State: AFq9FYJZMENfXar/jvF5g8V8bLZj0dFn9zq1UiC9naHonB8gEab1uGPB
	N7MC7cWpuj/zKtjrxAzw7kZC0ddSfkEmomM8EI1jlZWlFv8lOF+ZxBYe
X-Gm-Gg: AYBFou3HXAqXbHUTKsOTsxtBELNid0axV83G8FBchdu2Hf/evyZKHFQJ7eT8O39qMj0
	9hVBNfjWyIovEsUfzu7luCzP4srVrUhVNuM+vvPkRBDJSmVxh1gyZgGWrXIqPby1gQliJajcA/g
	iP9BnxFOkNvtL3YQDSgit2UE0usr3NkqywdodyWXzqV86Fwj5svfR/iJ+2KmZklb3mphmb0uyIo
	9MKrzmYAdzzJH06CJWwWHX56+aRZpfE/0Uhts0PLMsjFaP/DJzxtSPHmLcoLrN3ArzWEbJblvvW
	0aLUrDu1nuTtO/A/ztG30wpO9gqH65CUZEfeWVjaPQqMpE8/wYkVC8gku/DNvOTg5MD9HD/5Htt
	RQLC0L1A21sXLiz4+IuQuQhs9Kdij+YQH8veF7mAT4IOy2xoL/kGt6drOfwjLjA0HcEPVa6GpQ8
	RjmkGPHolZgITTZtsytACfN2ypu9S/Le6LQ4BrWnyV8hJe+KkXtaluGBUblO1Ruvb01QyvRVcC2
	n9vUxY/s/P43vlweOtV2c6Ehh27vrQE6BQPFapvLdgYdJ7bSUZMO0Zwyp4kadQdZQmFwfc5/JbL
	SwKekLGdagupaj3M0K3dtGGmWZVssQjI2TWhZSoL0JRZykLMBNc2nAqxJKOzCHFp7FHqSLSVgYY
	u3xbIi9oIKIXm0tqy2yGRzh4ce2uKxut6G1Wwb8VhTycoNPM9IAUsYUWZmKM/n/T7/uQ=
X-Received: by 2002:a05:600c:620f:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a967e8d69cmr98876805e9.35.1793262003012;
        Thu, 29 Oct 2026 01:20:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm31161541f8f.7.2026.10.29.01.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:20:02 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:19:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [avpatel:sse_test_v10 4/9] arch/riscv/kernel/sbi_sse.c:66 do_sse()
 error: memcmp() '&regs->a6' too small (8 vs 16)
Message-ID: <202610290605.80V5NQDW-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git sse_test_v10
head:   b153606b426cd9cdcd8786f48fc3774eb1f61abe
commit: cbb75c80fb5ab84a43c76c8796f793402216b21f [4/9] drivers: firmware: add riscv SSE support
config: riscv-randconfig-r2200-20261029 (https://download.01.org/0day-ci/archive/20261029/202610290605.80V5NQDW-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610290605.80V5NQDW-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/sbi_sse.c:66 do_sse() error: memcmp() '&regs->a6' too small (8 vs 16)

vim +66 arch/riscv/kernel/sbi_sse.c

a15f710cb89bf2 Clément Léger 2026-09-11  33  void noinstr do_sse(struct sse_event_arch_data *arch_evt,
a15f710cb89bf2 Clément Léger 2026-09-11  34  		    struct pt_regs *regs, unsigned long hstatus)
a15f710cb89bf2 Clément Léger 2026-09-11  35  {
a15f710cb89bf2 Clément Léger 2026-09-11  36  	struct riscv_sse_interrupted_context context = { regs, hstatus };
a15f710cb89bf2 Clément Léger 2026-09-11  37  	struct riscv_sse_interrupted_context *previous;
a15f710cb89bf2 Clément Léger 2026-09-11  38  	struct sbiret sret;
a15f710cb89bf2 Clément Léger 2026-09-11  39  
a15f710cb89bf2 Clément Léger 2026-09-11  40  	nmi_enter();
a15f710cb89bf2 Clément Léger 2026-09-11  41  	instrumentation_begin();
a15f710cb89bf2 Clément Léger 2026-09-11  42  
a15f710cb89bf2 Clément Léger 2026-09-11  43  	/* Retrieve missing GPRs from SBI */
a15f710cb89bf2 Clément Léger 2026-09-11  44  	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
a15f710cb89bf2 Clément Léger 2026-09-11  45  			 SBI_SSE_ATTR_INTERRUPTED_A6,
a15f710cb89bf2 Clément Léger 2026-09-11  46  			 (SBI_SSE_ATTR_INTERRUPTED_A7 -
a15f710cb89bf2 Clément Léger 2026-09-11  47  			  SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
a15f710cb89bf2 Clément Léger 2026-09-11  48  			 (unsigned long)arch_evt->interrupted_phys, 0, 0);
a15f710cb89bf2 Clément Léger 2026-09-11  49  	if (sret.error) {
a15f710cb89bf2 Clément Léger 2026-09-11  50  		pr_warn("Failed to read interrupted registers for event %x: %ld\n",
a15f710cb89bf2 Clément Léger 2026-09-11  51  			arch_evt->evt_id, sret.error);
a15f710cb89bf2 Clément Léger 2026-09-11  52  		/* Let the client quiesce its source without using incomplete regs. */
a15f710cb89bf2 Clément Léger 2026-09-11  53  		sse_handle_event(arch_evt, NULL);
a15f710cb89bf2 Clément Léger 2026-09-11  54  		goto out;
a15f710cb89bf2 Clément Léger 2026-09-11  55  	}
a15f710cb89bf2 Clément Léger 2026-09-11  56  
a15f710cb89bf2 Clément Léger 2026-09-11  57  	memcpy(&regs->a6, arch_evt->interrupted,
a15f710cb89bf2 Clément Léger 2026-09-11  58  	       sizeof(*arch_evt->interrupted));
a15f710cb89bf2 Clément Léger 2026-09-11  59  
a15f710cb89bf2 Clément Léger 2026-09-11  60  	/* Make the interrupted frame visible while clients handle this event. */
a15f710cb89bf2 Clément Léger 2026-09-11  61  	previous = this_cpu_read(riscv_sse_interrupted_context);
a15f710cb89bf2 Clément Léger 2026-09-11  62  	this_cpu_write(riscv_sse_interrupted_context, &context);
a15f710cb89bf2 Clément Léger 2026-09-11  63  	sse_handle_event(arch_evt, regs);
a15f710cb89bf2 Clément Léger 2026-09-11  64  	this_cpu_write(riscv_sse_interrupted_context, previous);
a15f710cb89bf2 Clément Léger 2026-09-11  65  
a15f710cb89bf2 Clément Léger 2026-09-11 @66  	if (memcmp(&regs->a6, arch_evt->interrupted,
a15f710cb89bf2 Clément Léger 2026-09-11  67  		   sizeof(*arch_evt->interrupted))) {

This is a false positive.  This type of warning is typically
silenced using a struct_group().  Otherwise with the right
FORTIFY configs set up it triggers a WARN_ONCE() at runtime.

a15f710cb89bf2 Clément Léger 2026-09-11  68  		memcpy(arch_evt->interrupted, &regs->a6,
a15f710cb89bf2 Clément Léger 2026-09-11  69  		       sizeof(*arch_evt->interrupted));

Same.

a15f710cb89bf2 Clément Léger 2026-09-11  70  		sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE,
a15f710cb89bf2 Clément Léger 2026-09-11  71  				 arch_evt->evt_id, SBI_SSE_ATTR_INTERRUPTED_A6,
a15f710cb89bf2 Clément Léger 2026-09-11  72  				 (SBI_SSE_ATTR_INTERRUPTED_A7 -
a15f710cb89bf2 Clément Léger 2026-09-11  73  				  SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
a15f710cb89bf2 Clément Léger 2026-09-11  74  				 (unsigned long)arch_evt->interrupted_phys, 0, 0);
a15f710cb89bf2 Clément Léger 2026-09-11  75  		/*
a15f710cb89bf2 Clément Léger 2026-09-11  76  		 * If writeback fails, COMPLETE resumes with firmware's original
a15f710cb89bf2 Clément Léger 2026-09-11  77  		 * a6/a7 rather than treating the shared buffer as committed.
a15f710cb89bf2 Clément Léger 2026-09-11  78  		 */
a15f710cb89bf2 Clément Léger 2026-09-11  79  		if (sret.error)
a15f710cb89bf2 Clément Léger 2026-09-11  80  			pr_warn("Failed to write interrupted registers for event %x: %ld\n",
a15f710cb89bf2 Clément Léger 2026-09-11  81  				arch_evt->evt_id, sret.error);
a15f710cb89bf2 Clément Léger 2026-09-11  82  	}
a15f710cb89bf2 Clément Léger 2026-09-11  83  
a15f710cb89bf2 Clément Léger 2026-09-11  84  out:
a15f710cb89bf2 Clément Léger 2026-09-11  85  	instrumentation_end();
a15f710cb89bf2 Clément Léger 2026-09-11  86  	nmi_exit();
a15f710cb89bf2 Clément Léger 2026-09-11  87  }
a15f710cb89bf2 Clément Léger 2026-09-11  88  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

