Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B611B1624C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204711; cv=none; b=qSm56qhT/22og9fl/AIWDpntLYN9MXNjqUFav7B97WFlEdcHdeiXfNz0ISfAI5bHhW5RCBajrMCBZJRAeNVXX9eoPD3t5KvJ/JD9QLQSBB4h68Fni3S1juIvy+Y1z1Lzh9Ljt9OJ7d2pYjgyya0KjWeODIMPgJIimHaKdwdUjLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204711; c=relaxed/simple;
	bh=JggR+4lhgxon5VrrXYFEgHKpnGz2RPpuX3MhDbFS6oA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARQOn2LBKawqHDcEHFD+777jGKBO83YgXZD9mtDTU1+3eFA1RPn0eXoR8xCQuYaKjHKNYn8LKht4/sJQLAhiQkM9LUC0FZhDCvZ27xdmcQ//mM06h4V7EzMa7e6eA2tGNMOtmzkG80x0YOpgfoSCx6ji/pL8Bhz8TkO0Mf160oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V2remf0+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V2remf0+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4711f156326so4034855e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761204706; x=1761809506; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7rh8SJ9gjn1LcIjZxSZPwMUci0AXXC8rNsZtSMot00=;
        b=V2remf0+8a/OrEzstsr0X/tH16QxqGVhdl+SfF9CoBkn9Pa7X391mi/J/rzNkENDyS
         j14Q1rM65KKp/6YMibLM5DII8jVDT48fVRDBNLycjjDShTFwHmOV2prp3TyERcgsuiRz
         5n8gHwN7j0E/ewRtHsVMd+KfgeR/4AP2CMw/whUd3vVlwGNRWHqkUuyywKd1d4IBX92y
         KUdCuov0+gV/5lj1E9rpRoTlVECD42VBHYU7zaY/SRtWE21wYZ3laPHQmtJWjKii3A8T
         guiy4uLysH4zHhwxzESZYhYqE9uWipU2dBL8cOr88Ry6+52ok9gCkkvDVCSpHYlxCI3S
         Irgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204706; x=1761809506;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7rh8SJ9gjn1LcIjZxSZPwMUci0AXXC8rNsZtSMot00=;
        b=GbKJczrnJw9t8kwDPCjj/BRyO1Kk6OhcMu+mVuuxa6QnFTNTuQKkmFCtJ2iKsm2ILo
         bhMTzjRsXrY7mK/vxCThWHNAeEi0aHrnPPr+rEkDYLSsS9W3SiKeNoSc5XUDlAMD2Nw9
         BWPlvhLUvnaaWxKtbO13tomDmRLABR4+Jt9QqwbvUhEm5Dn3mX+QOC7jDrGM7pSNjnEI
         DxddnTccAI3z0JN6J8mYQCQvFNW1Oc8p7kv8HdiiX4rZtlEsQfJ2dGxv5qyfPDSc7mic
         Y5Wk1pkV+Is1zVcmYpSd4BtOKyhf7sQiZ+Od311HhOSWJJ2vs6xC38FFMuGm0sDP+Fwg
         IiWg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ4S2in4+3AZZdNAFWDb/lqQAd21cGx34vOQ/pmQPz816YyFxt7OBILqXnuvKvQolPbdym/f/zLHfjVL2+@lists.linux.dev
X-Gm-Message-State: AOJu0YwBy9ES0KFq11jX2NxbqcEAdurS99cm2/hjSSd7EY60ttd36+Ze
	NfI1gJDF2r8DRYGMxcVxTJ3wwnKStNtUh/yqagV3+iwMzOyM//dEJIdRPnBTakumzU0=
X-Gm-Gg: ASbGncug3RnUL9q6A3AOB9FhotYywUna2nrMol5/+fRQL7o9VjcXUV5+BugXurvSd5z
	QGbfp1u7EpaD7nFXtYlx0NBZuPqeff7G8y82omU32bRgqpUuiDoh4oElmj9almXTJyJTglDuikE
	UhYcyI4GhYZszfCDeVFglbX5st6cO59gR+bofoTJkyJStl+UDSBPoANmn+RsEUxfV9E5/0S8YsT
	0QzW74DnXWk0EGjeYcpSe1YC49x8GYHp1+LAP6W7dcBWOOSJhrW+0pJHSSCd/Qo6EdUcNS0+MO4
	BqhlAf4jL9tpcm/R14r8dm2uSoGDZ0lpDph1C+O+ZlCS7dQCOurdEyCgVDYyEUTopBiWQ9vOwdZ
	MQ5iNG4N4D0AUvHiV9fhoOpQ646D+mp/DkV27dvUg24zPs0l/bFqj4BwrmtmLKEa2jqkaRUfxsL
	gDZq+7dvmB7L/YYcZ+
X-Google-Smtp-Source: AGHT+IESUWagdqnffAAf3bOVzRjniJgfIHxBtYyyZ9IRSdPPeiTfClecTkaGhBF5qh1fVlFvauXFYg==
X-Received: by 2002:a05:600c:3b8d:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47117917155mr159364105e9.26.1761204705823;
        Thu, 23 Oct 2025 00:31:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c428e9b2sm82179725e9.5.2025.10.23.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:31:45 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:31:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jack Pham <jack.pham@oss.qualcomm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [usb:usb-testing 45/48] drivers/usb/typec/mux/ps883x.c:171
 ps883x_sw_set() warn: inconsistent returns '&retimer->lock'.
Message-ID: <202510231023.aJ09O6pk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   93741bd104ce07a790519ecee3a331ee7cf61ae3
commit: f83cb615cb7a615f9c15787f914a8eee1c6e93d4 [45/48] usb: typec: ps883x: Cache register settings, not Type-C mode
config: i386-randconfig-141-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231023.aJ09O6pk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510231023.aJ09O6pk-lkp@intel.com/

smatch warnings:
drivers/usb/typec/mux/ps883x.c:171 ps883x_sw_set() warn: inconsistent returns '&retimer->lock'.

vim +171 drivers/usb/typec/mux/ps883x.c

257a087c8b5206 Abel Vesa     2025-02-06  145  static int ps883x_sw_set(struct typec_switch_dev *sw,
257a087c8b5206 Abel Vesa     2025-02-06  146  			 enum typec_orientation orientation)
257a087c8b5206 Abel Vesa     2025-02-06  147  {
257a087c8b5206 Abel Vesa     2025-02-06  148  	struct ps883x_retimer *retimer = typec_switch_get_drvdata(sw);
257a087c8b5206 Abel Vesa     2025-02-06  149  	int ret = 0;
257a087c8b5206 Abel Vesa     2025-02-06  150  
257a087c8b5206 Abel Vesa     2025-02-06  151  	ret = typec_switch_set(retimer->typec_switch, orientation);
257a087c8b5206 Abel Vesa     2025-02-06  152  	if (ret)
257a087c8b5206 Abel Vesa     2025-02-06  153  		return ret;
257a087c8b5206 Abel Vesa     2025-02-06  154  
257a087c8b5206 Abel Vesa     2025-02-06  155  	mutex_lock(&retimer->lock);
257a087c8b5206 Abel Vesa     2025-02-06  156  
257a087c8b5206 Abel Vesa     2025-02-06  157  	if (retimer->orientation != orientation) {
257a087c8b5206 Abel Vesa     2025-02-06  158  		retimer->orientation = orientation;
257a087c8b5206 Abel Vesa     2025-02-06  159  
f83cb615cb7a61 Konrad Dybcio 2025-10-14  160  		ret = regmap_assign_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
f83cb615cb7a61 Konrad Dybcio 2025-10-14  161  					 CONN_STATUS_0_ORIENTATION_REVERSED,
f83cb615cb7a61 Konrad Dybcio 2025-10-14  162  					 orientation == TYPEC_ORIENTATION_REVERSE);
f83cb615cb7a61 Konrad Dybcio 2025-10-14  163  		if (ret) {
f83cb615cb7a61 Konrad Dybcio 2025-10-14  164  			dev_err(&retimer->client->dev, "failed to set orientation: %d\n", ret);
f83cb615cb7a61 Konrad Dybcio 2025-10-14  165  			return ret;

mutex_unlock(&retimer->lock);

f83cb615cb7a61 Konrad Dybcio 2025-10-14  166  		}
257a087c8b5206 Abel Vesa     2025-02-06  167  	}
257a087c8b5206 Abel Vesa     2025-02-06  168  
257a087c8b5206 Abel Vesa     2025-02-06  169  	mutex_unlock(&retimer->lock);
257a087c8b5206 Abel Vesa     2025-02-06  170  
257a087c8b5206 Abel Vesa     2025-02-06 @171  	return ret;
257a087c8b5206 Abel Vesa     2025-02-06  172  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

