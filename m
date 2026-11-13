Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572504;
	b=nipWJ3ESgLyreuSoeb6LcU7EmXOE0dPTmsZ+eqGiiw5YCvmeX/lCi7fMNGAZrzqiH4PY
	 R6kbZIJaAqL8wUOGJTwnhmurnUjmYshDYPD1O5gYEcAkSGh4A3dsS+N/bornkN09L2/b+
	 qHOgHLKOGaHQrwaSl7id0GWh2fOgDgP5BYQ7+lKmuVjmK0F4T89VGRxWV2CrRd8mB5oFi
	 9+bQYAr5pNlRRaIxRnvJDag11UjAA7fTMW31EOTynjr6tTk3sx4px1q9O9iubfzpy11Yk
	 pJxnlYzEJSjLGsFYABdckuNrz/Y0qqdTfyjTJWG8tHJvGbcW3/iDm4g0xhYHuTWIESA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=WQEazG5lwx/yGmxmxj+KfS8sarmZMLT83W/zazuaHx0=;
	b=JABPPgZlcz+U0rj+cw4zRuiClyclRQvwAwPn+42erhz0QojKew3WVxP/pzb4SIC2jkWM
	 gtxvdBjpB/djbgzU13w4DfQtVfNKpc1im09UQ1YIDhBApM0TcWIiW7A6aDds7OgSD6r5e
	 r9gfYj8U+kULs84Xd/oybpYwEfKQ3zsgHCInU1gwQvkjIVZZX+HHRCHv7UtVjpFQK7vXB
	 ai+3b0Ts6XQ7i93isZU9M+GDT+KvC3he1S1G4aARzV6dQcWcEREOP59ylfkhcOQn5+kRL
	 5Fg5YKMDIMHF1XDbwAFcsnvE648UIXmzu95+5s3r8sL/YrY1kFcBJI8XH23R14rnBvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQlg12Su;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570AC60A3804
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 12:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 570AC60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQlg12Su
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490d59c3edaso481029f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 04:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794572503; x=1795177303; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQEazG5lwx/yGmxmxj+KfS8sarmZMLT83W/zazuaHx0=;
        b=iQlg12SuSTaXiujdVD5tw1LVOCufvCl7Qs17NnQmIOcBrGHCg6CMkx+DTDT7zIFL3m
         ZjEs/epqs7eIktY3spGSzDbdT5iepUCacT6lPsfoKQDqtkZ5g5RBnwIsGi30K33Vbl70
         wkmddBhfPxebF0TNvfgzI+kGbSxjYc2tMzGPhntD6HtD7gg5ghtMXIvGHyk6OW8/pSmL
         gXyj6V+L7lqSOTZzBtPaPDuoBRH9NSDFDwcpF9ZpoKGquWNQtltBT4QOWL4k+RPb4WfS
         EoIZu7k0dbKA/CKOYu1IASk+/CYPFh2++BfK5813JQadUHP4AyZiFXY3k4mOtDJQP3tm
         Uo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572503; x=1795177303;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQEazG5lwx/yGmxmxj+KfS8sarmZMLT83W/zazuaHx0=;
        b=UiTYvKawiATTiQ8hE4083KNAxG88WMXwbvnLU9x0C9Ag9GxifuDWgt9b2mDGugfKid
         mbV5olsyFU/NUnfMWp8YbT+OiPxcrEMjDlB+v9CyhZCjhlJV1ZY3DLd48B4H079Wkz8v
         fpLmDdivRCjM9EzEQbrbnid0L2CsQmpTqKeK1Ud1Mz1qTviDNc0xGGdno02tzrMj0LFC
         o8sDMDtq+7B/lLf1oxwAjbYP/ij1mHNpIb45whDMsNnokrLuPJB5nhupJSRSqm9C3iXD
         FROVMGIC9a5R0pC/2a3Md2d3aMxCbT1eYAcz8qnqc/fmOsgWZtGOSVBNEIssFQ4d+9hi
         oDXQ==
X-Forwarded-Encrypted: i=1; AL+hErFQ+KfiUG6VFN9QmXjbpc3BfK+e764xo+SkQqCyqlF+l2BD8m2sq52lBbLxyZv/VHRwxinIaJsnAa5Pue2w@lists.linux.dev
X-Gm-Message-State: APuU4Z9jEmvKTTX8hCUjQI8yoMDrOekM7q6qZ2OiSfHLvZIWuhVcDw0w
	eP/I7ecNmUmo114gz7kxaD7nfvOR2xdqHBWo6beWFwTlxW2Th0LcarfK
X-Gm-Gg: AYBFou06faZKJg7V1UYjAwwmq+NakgQWWDYmculb8yPT6T5UV0Ysnkc3yO68Cda68xc
	SJBzRoHKrhD1+FoieWSTclLptq1nCAizcw+5qBts/ueDaMbOPCjPg2z0O5IGDDHWDDppnEOa8fZ
	/KYpLVnRBjkBJxokzya3fxEsAH8/DGzZBKzlJ+PrQtlK+KtyfPNK/KCqZQn01/n0i6e/eBqX+yz
	xovAMGf73D7AJhm5YVMVT2xpO23qhCe9t2xEYJPYsEcG06aaDvijUdK7O8lcLARKdYRUmsiWf3p
	5C+YyHsWNmGMuBchWccGDBRWTIVY9LR5MjZ6y0jyt2PzoLZwq/T47111+QW2bEziwFljrur5SOF
	Uqurh3fZSEgYK0i25x5Kr6nh0JI6hAmR3u+JpzOzliJX6hLu3CCRO/KvU68g83y//zGecIzaOxB
	gHIpnqalPenkhXIC6LmTmot17m2d0byVl9ow74lxt6vtrVPCvpXo90sjhWfigSwyuza9AkB8ZZi
	7cBXqsQKvl8Jwkxn1n3HVObnLLNquRcZSBwbWQs9DvdU2M5qfD3JDF6W86BmNJLmvKNxqbQo6E9
	m7Ax5iLvx/4/MiQVnC6+sC9u2FZ0bVYtRg12ojSdmwJvtipM22vxfHtT8FlE9yDFUUopUdw3pgJ
	9JurZIt2syCJFa9gxp0o1YEkAOedisz8JbscWx6GLIRE0yut4C78mZ1D42rByeN1l2ombFShxM5
	Mo3+IRcU/5K0l5
X-Received: by 2002:a05:6000:29ce:b0:492:9c9:65de with SMTP id ffacd0b85a97d-49c6f5e833bmr3959646f8f.5.1794572502418;
        Fri, 13 Nov 2026 04:21:42 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm7560175f8f.44.2026.11.13.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:21:41 -0800 (PST)
Date: Fri, 13 Nov 2026 15:21:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 432/438] drivers/fpga/fpga-region.c:65
 fpga_region_get() warn: variable dereferenced before IS_ERR check 'region'
 (see line 57)
Message-ID: <202611131301.NSbZ3bLn-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux thread-safety
head:   8ea0e62cf4d68a895e3152c92a5f6ead6d5c9554
commit: 67c65b05abaf7a89e1e4f8ed3033513d6053a749 [432/438] treewide: Replace __context_unsafe() with precise lock annotations
config: arm64-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131301.NSbZ3bLn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611131301.NSbZ3bLn-lkp@intel.com/

smatch warnings:
drivers/fpga/fpga-region.c:65 fpga_region_get() warn: variable dereferenced before IS_ERR check 'region' (see line 57)

vim +/region +65 drivers/fpga/fpga-region.c

0fa20cdfcc1f68 Alan Tull       2016-11-01  46  static struct fpga_region *fpga_region_get(struct fpga_region *region)
67c65b05abaf7a Bart Van Assche 2026-11-03  47  	__cond_acquires_err_ptr(&region->mutex)
0fa20cdfcc1f68 Alan Tull       2016-11-01  48  {
0fa20cdfcc1f68 Alan Tull       2016-11-01  49  	struct device *dev = &region->dev;
0fa20cdfcc1f68 Alan Tull       2016-11-01  50  
0fa20cdfcc1f68 Alan Tull       2016-11-01  51  	if (!mutex_trylock(&region->mutex)) {
                                                                   ^^^^^^^^^^^^^^

0fa20cdfcc1f68 Alan Tull       2016-11-01  52  		dev_dbg(dev, "%s: FPGA Region already in use\n", __func__);
0fa20cdfcc1f68 Alan Tull       2016-11-01  53  		return ERR_PTR(-EBUSY);
0fa20cdfcc1f68 Alan Tull       2016-11-01  54  	}
0fa20cdfcc1f68 Alan Tull       2016-11-01  55  
0fa20cdfcc1f68 Alan Tull       2016-11-01  56  	get_device(dev);
b7c0e1ecee403a Marco Pagani    2024-04-19 @57  	if (!try_module_get(region->ops_owner)) {
                                                                    ^^^^^^^^^^^^^^^^
Dereferences

0fa20cdfcc1f68 Alan Tull       2016-11-01  58  		put_device(dev);
0fa20cdfcc1f68 Alan Tull       2016-11-01  59  		mutex_unlock(&region->mutex);
0fa20cdfcc1f68 Alan Tull       2016-11-01  60  		return ERR_PTR(-ENODEV);
0fa20cdfcc1f68 Alan Tull       2016-11-01  61  	}
0fa20cdfcc1f68 Alan Tull       2016-11-01  62  
c3d971ad32fc19 Alan Tull       2017-11-15  63  	dev_dbg(dev, "get\n");
0fa20cdfcc1f68 Alan Tull       2016-11-01  64  
67c65b05abaf7a Bart Van Assche 2026-11-03 @65  	if (IS_ERR(region))
                                                            ^^^^^

67c65b05abaf7a Bart Van Assche 2026-11-03  66  		unreachable();
                                                        ^^^^^^^^^^^^^
You're presumably testing out a static checker I guess?

67c65b05abaf7a Bart Van Assche 2026-11-03  67  
0fa20cdfcc1f68 Alan Tull       2016-11-01  68  	return region;
0fa20cdfcc1f68 Alan Tull       2016-11-01  69  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

