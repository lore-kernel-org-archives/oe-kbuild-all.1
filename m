Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A54F3D330C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440832; cv=none; b=mMOLQbJi8H8r+WzJOUopVHjF2ZLhwd5TfSjDcTIKjzIyUzf/Fgmt5S3Qo/W811sAed2WtmXsNgzlT0c3KEGmnkHMcltuPtkYU1qI/QwgoPuImu6ure1GKPHo/zlDR4mZ8aLJnmWaDE8b5/CRS/x5bQcH/1Mjeol63qoy0iwOXQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440832; c=relaxed/simple;
	bh=Fb2dFEFBTzTYZiSW4NQ8boEo0Fa4e1j9QdAbr1VO+D4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZM5/k7PiKN6bRcqCa07rTXK0Mz3n9hPy51/fC9AL0THCn4AUww36LbF8MicvATkpFtxVxWzkzq2wvomZ6/zSRvUAHgClelyHcvgTeM1Hqu+p1NqEaReI2FzdWXnIWmw71VPr2A5PDAyTP3T4iA6foi0AQjdyYE7SsjT+hC0isI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8pGUaKQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8pGUaKQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fb439299so54290145e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 05:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774440829; x=1775045629; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5E6moPRnekbmqdlOzYEpEz2bsLuOvHYrX+9kNxnP+U=;
        b=q8pGUaKQj2RYpzCZz7fqkB+VEvhZjpDY7nHX4LK68xMr4lqdXej1SFTOIk83EYAbIK
         qeERdSxmeNiiNyNiTYQ8Be0iPPVlnBvOIlGrheQD9Z5KprdQox7p8ddc4JMFD7RIV62U
         m5LG+qfqdEZ/5Pl7R3+bEmmdKR9uRRdcIl+LzH53cXld9CoHtVyiA0xNGaKCIMMJa/hy
         0GSJ+NTiSaMdmh7SF4jMTVnEEMVELODpNkO9TGtcZna/imOznCdMnu43ySjUOvzsogT/
         NnZ7NbQU2c3637kFP7viSVzLBfU/yO29SsXP5pi1kBGikY0iu6jpksFC3Us/lBzKpVrn
         lH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774440829; x=1775045629;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5E6moPRnekbmqdlOzYEpEz2bsLuOvHYrX+9kNxnP+U=;
        b=JnLVfXLNuCSe52uuOywKcrHqLSwnMkJFVJbr3QOCowR/OlQE6Y/KwiKfPb69GRKnNw
         vi/xXdFdCBJsZLVmQ6u/C2vREZSJMt7f5uQx9Tp8z3mRWJEEHv9Z8p/3btZ1421Z6l3K
         W/oU1uylX0EqVO/7cRNEdBWmefpYrkOaN30XuXj7kSOgxV7Jj2Al33l5V5nwPIfRow2D
         p4fqmlwyZhlzVG4HKg4nnes8KEMJie2WERZOBgy+OYUSOM6/OjB6C0DrjRyhJgah8bBy
         mLJoPu2MHB3WyIbXyVTCjLFXtC9MybeaxvKb59j8dyZXicK7bMFo+QOR18trR51uHgrY
         h/6g==
X-Forwarded-Encrypted: i=1; AJvYcCXFEr4BL/TxWzourMWkEjqQg3LzpgBz8Q5yzsVpIih8Lp8/pyBQWBvUxhqhyzh0vVB8em+THiqaT+2qOLQA@lists.linux.dev
X-Gm-Message-State: AOJu0YxIWxoB36NGvyJyquim9e97b1EOdKGfjWHdyCz6g/9ptSThoj+p
	QgnZcqVg5AkGqXfc1i2Fz8NLHzE3zLBBrtNVtvQ9EZjydaUX13yoQvaCpFVl1Bu9suk=
X-Gm-Gg: ATEYQzzJG/85xZ7mh0LjwImKXQo5sSsxbW719gDpsESEqkqdN9hKjA4bBJTYWZfbAKO
	vDv6fFgw5DBF/jd+deIFyIC3s7pQy8B0bOGDVROPNYap2vOl7mIDRS1OxFFPmNik0APS+AK6aV3
	LN3wurnkRMwJ/KxLoSM9uynaBg6nlS3Y6bHIHzdnpxptEEoiPxoGm3UMgQq95gKR3N8bOoXstNC
	37sT0L80jyUZRr28pAm/ILChCNX0kFP8bQuFrB7rAgroE5XFo55XSE9WfZ93xjuDEBKSt+bWaul
	J+U9B30gpjvXsiIBGEPgGZ2tA5Biaac+ATdvUYIvj9ZDtCRWVnKrjMptemFGD7/0jd2JSbvk8L6
	yOyzM/FuDFABRCu73hjBzeIQSAoENR+Ai02CsJezUTpS489bB4N9SY5sc1bu4JW8RdkZm9DRChd
	qrXuaTYPrkl6vJCMLp8FqzkStJY7gE
X-Received: by 2002:a05:600c:45c4:b0:485:3c8f:e4d9 with SMTP id 5b1f17b1804b1-48716067413mr46067455e9.26.1774440828759;
        Wed, 25 Mar 2026 05:13:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64714e2esm49760795f8f.32.2026.03.25.05.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:13:47 -0700 (PDT)
Date: Wed, 25 Mar 2026 15:13:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Michal Wilczynski <m.wilczynski@samsung.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Kees Cook <kees@kernel.org>
Subject: drivers/firmware/thead,th1520-aon.c:174 th1520_aon_power_update()
 error: buffer overflow 'data' 2 <= 3
Message-ID: <202603251917.9rxYz4kf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: e4b3cbd840e565484d0ad8d260d27c057466ed17 firmware: thead: Add AON firmware protocol driver
config: riscv-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251917.9rxYz4kf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603251917.9rxYz4kf-lkp@intel.com/

New smatch warnings:
drivers/firmware/thead,th1520-aon.c:174 th1520_aon_power_update() error: buffer overflow 'data' 2 <= 3

vim +/data +174 drivers/firmware/thead,th1520-aon.c

e4b3cbd840e5654 Michal Wilczynski 2025-03-11  162  int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  163  			    bool power_on)
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  164  {
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  165  	struct th1520_aon_msg_req_set_resource_power_mode msg = {};
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  166  	struct th1520_aon_rpc_msg_hdr *hdr = &msg.hdr;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  167  	int ret;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  168  
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  169  	hdr->svc = TH1520_AON_RPC_SVC_PM;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  170  	hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  171  	hdr->size = TH1520_AON_RPC_MSG_NUM;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  172  
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  173  	RPC_SET_BE16(&msg.resource, 0, rsrc);
e4b3cbd840e5654 Michal Wilczynski 2025-03-11 @174  	RPC_SET_BE16(&msg.resource, 2,
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  175  		     (power_on ? TH1520_AON_PM_PW_MODE_ON :
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  176  				 TH1520_AON_PM_PW_MODE_OFF));

This is deliberate, but I'm surprised the runtime hardening we have
done doesn't complain that we're writing outside the &msg.resource
struct member...  Maybe the RPC_SET_BE16() macro adds enough indirection
to confuse the checker.

Why not just do?:

	msg.mode = cpu_to_be16(power_on ?
			       TH1520_AON_PM_PW_MODE_ON :
			       TH1520_AON_PM_PW_MODE_OFF);

e4b3cbd840e5654 Michal Wilczynski 2025-03-11  177  
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  178  	ret = th1520_aon_call_rpc(aon_chan, &msg);
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  179  	if (ret)
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  180  		dev_err(aon_chan->cl.dev, "failed to power %s resource %d ret %d\n",
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  181  			power_on ? "up" : "off", rsrc, ret);
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  182  
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  183  	return ret;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  184  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

