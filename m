Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0B546AED7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 06:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769062076; cv=none; b=R9dzy4Ez0sa7O/OdsB8v1OJ6I0Yc6HzNgIdeyUWesyDiHCCyEwTxZH/44migdPLEM89eEbkUYpfEUKZDMVWujCHS2itablOQM/VRcSVanmihWR3crgLkBg23wRioBT4jSFTmn0Lz4/8kLFNx3y9eHMAIjbi1AbsTOQnOCYZBRWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769062076; c=relaxed/simple;
	bh=1o5NqahfDQ5VNbcqleS+o4wBaycfjfXYCwkC1X8D/Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=s1XsBpPhJ66x9L2xQU+NjUNSlsg6qTisZ88yj9Q3tZQiahLausy3eCiW7anfdqqJpOCnYLLmgscZFAd5jl30ZiiygXCyeXtCGIiZkMqMhJ050gGiJlG4EMfKjI5vaDmNpUHlWURC5pxeiqdMOlM/4pOgbO6cfmTySznor5Xmgwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TCmtl1qn; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCmtl1qn"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43246af170aso368542f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 22:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769062073; x=1769666873; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNY/LXM5CUd8SovQrwoI4Q/jBB7ob8o4qFKazdU5gjs=;
        b=TCmtl1qn1mWaybOJeqLIrTWE/+e6Aqk5lkTvvApRDe74k4BBa2cEocCQc9nG6U0LHw
         s6GkmI3tPeet5QmkEY6RAxXo9Nmc/VFAA6mH/jJ4ju6lZTb3FSZZsPxAefJT7VNYMXG1
         Byv2Vr9vPCSKIS0GegFSjLrGSw+bkfBnueKYDwyHXOENgY8M0Q84U/WLNS9GWTJ49PbU
         dkygCGz5kkwi3erSkuZo0Nt6Fk1iG0ERH8FIg5ymFIf9L7tYngncCSB9IQ+6q2bNvCgo
         vCc3sTygziO4gso4LZhAVaQYv1FD59+p+UymEYTfLdZS+odckcC7EY2f7hm1TKe7pU2x
         jskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769062073; x=1769666873;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNY/LXM5CUd8SovQrwoI4Q/jBB7ob8o4qFKazdU5gjs=;
        b=lNz4polFa63BN4QCKYtHjY0OGd4hOjubad+/IlfAts85hxcXxFKCUuNqTKpfx1QH3J
         1MI1X/vbdCotZkM55Q9oou4bcFOyT16vjAcqDzX+iVh67gxdcEfcaDSIP/janDY+zZpe
         Hq50Vq92xms1+kxEBsK3+as867oi8o0wFeHOcL76vCOU8KREHqPcPPEHKS0YONWY2AkX
         q9FcjnrvVuWnC6PA3qAF2Z56uxOyNZu/fyydeBcYZQJBZs+g/bFney/PrQssqRYzt08p
         NShHEKhqgmr1DIMnIkUONDMvDgPiuiWEMCjd8SAO/4LCjNsMc2iLS60r4CZlvT26PGHd
         4daA==
X-Forwarded-Encrypted: i=1; AJvYcCUSybtiB120EI0FSyortPhHw3YGOko+9G7A3faQXmjHKFZsxugf8JFhYepASBvvrxhekKDCr71/ZBG/zYQC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7NWtc++CXo3LFiqY30FM/D6L5yAKZeW4/mk81DY7PXMZqoBs+
	YPVxGDnY0X4aypcxLZDIy8HKRDDYcHtP3MJhfA17yC96yrd3ClZHxL1BQu67jW0Rdi8=
X-Gm-Gg: AZuq6aIosZ+0KJ9O8rgVy5OaD6ELaCdvniR879ql6s+T+tD/EqxiNQtOj/jG4QBBjL2
	nWcSE2p0fMMWq2WhrYMCg4BLORdjjiokewd6Aaklpkh6Ly8i7Wc8mIQvPgBaRGVRRr/VVX2paG6
	uUFKAA1EVA3AzZJAEHcMBFqudGbAxUmPEnAQDKhUSSsNH2sPMsHlVsHIIIhui22DkdIHXNH1Cn8
	Ls2kfRboJ+uSzZJD0Fv7fcD48cXMnqk0gxmi10stNZZBtfE7t4Cvq5OQsziZmKkrXMHk/ZB5FkY
	3Mvyw2nu9EHWmYdEVKakAqXTnRhUeaVQ8D/WhyiypnCAc/3fX11aSfrNwyl+f2XzSNKjgaEAgJW
	VQfN2b/nSUk9qYjCTZvRdfC+vgLWEHg9ODmQIIi/qRuYSwFsIMrN4W9r65a42ZdRzXzWccBtW7y
	Bzed9Cgua7v7G3BUJ9
X-Received: by 2002:adf:e88b:0:b0:435:9635:2943 with SMTP id ffacd0b85a97d-435a5f757a6mr2857800f8f.17.1769062072600;
        Wed, 21 Jan 2026 22:07:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm43165202f8f.2.2026.01.21.22.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 22:07:52 -0800 (PST)
Date: Thu, 22 Jan 2026 09:07:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <202601220733.dS3GMZRD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121060857.237777-1-acelan.kao@canonical.com>

Hi Chia-Lin,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chia-Lin-Kao-AceLan/thunderbolt-Fix-PCIe-device-enumeration-with-delayed-rescan/20260121-141206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20260121060857.237777-1-acelan.kao%40canonical.com
patch subject: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed rescan
config: arm64-randconfig-r073-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220733.dS3GMZRD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601220733.dS3GMZRD-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/tb.c:128 tb_pci_rescan_work_fn() error: uninitialized symbol 'dev'.
drivers/thunderbolt/tb.c:2392 tb_tunnel_pci() error: uninitialized symbol 'dev'.

vim +/dev +128 drivers/thunderbolt/tb.c

d6d458d42e1e15 Mika Westerberg       2024-08-20  102  static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
d6d458d42e1e15 Mika Westerberg       2024-08-20  103  					  int retry, unsigned long delay);
4f807e47ee9a75 Mika Westerberg       2018-09-17  104  
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  105) static void tb_pci_rescan_work_fn(struct work_struct *work)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  106) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  107) 	struct tb_pci_rescan_work *rescan_work =
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  108) 		container_of(work, typeof(*rescan_work), work.work);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  109) 	struct tb *tb = rescan_work->tb;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  110) 	struct pci_bus *bus = rescan_work->bus;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  111) 	int devices_after = 0;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  112) 	struct pci_dev *dev;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  113) 	struct tb_switch *sw;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  114) 	struct tb_port *port;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  115) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  116) 	mutex_lock(&tb->lock);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  117) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  118) 	sw = tb_switch_find_by_route(tb, rescan_work->route);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  119) 	if (!sw) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  120) 		tb_dbg(tb, "Switch at route %llx disappeared, skipping rescan\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  121) 		       rescan_work->route);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  122) 		goto out_unlock;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  123) 	}
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  124) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  125) 	port = &sw->ports[rescan_work->port];
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  126) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  127) 	pci_lock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21 @128) 	for_each_pci_dev(dev)
                                                                         ^^^

eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  129) 		devices_after++;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  130) 	pci_unlock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  131) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  132) 	if (devices_after > rescan_work->devices_before) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  133) 		tb_port_dbg(port, "pciehp enumerated %d new device(s)\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  134) 			    devices_after - rescan_work->devices_before);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  135) 	} else {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  136) 		tb_port_info(port, "pciehp failed to enumerate devices, triggering rescan\n");
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  137) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  138) 		pci_lock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  139) 		pci_rescan_bus(bus);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  140) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  141) 		devices_after = 0;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  142) 		for_each_pci_dev(dev)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  143) 			devices_after++;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  144) 		pci_unlock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  145) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  146) 		if (devices_after > rescan_work->devices_before)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  147) 			tb_port_info(port, "rescan found %d new device(s)\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  148) 				     devices_after - rescan_work->devices_before);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  149) 		else
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  150) 			tb_port_warn(port, "no devices found even after rescan\n");
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  151) 	}
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  152) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  153) 	tb_switch_put(sw);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  154) out_unlock:
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  155) 	mutex_unlock(&tb->lock);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  156) 	kfree(rescan_work);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  157) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

