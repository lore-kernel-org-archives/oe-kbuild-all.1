Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807050;
	b=o0Wm65e6Y8EfVi3WMotQtDOzRWJrCzjFOInzSL4TQ1CX/TyzjGMWm4xedL40fQw0DA+g
	 csKZu3muPrd6Q38szw8eoP4yLVkhMn/Dv3e46r7yZWUmi/FZCPk9N3soarIosSfTtABPy
	 JGFMS10UqbIj1wvBJelR84+uVMhwBQ42eK7ezDgoHphR7n+u2qEQhfU2EHyhLD21+jJ3T
	 vM7UewhWyETguQdNbb0HU9h7pCQKsNfLKUaChlo47xa0iEZ7HderQcZN5plTljR+y1kf/
	 J4dlhExziTbHjoWQ0bPgg2CNTB6Lzc2NEVxuB/55WnqgiJQK344DqmUYCDSDrUUb+Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=9OE8hBXnZhJ6GYouFE7YtTFL4tvumfnA83LbqqqWxZQ=;
	b=oXPbiDLHecPDTD/zpG8qNxRSso+teU1eZLdxb1dJnJ/bmBHt6Sztifej833RcO14NX5A
	 cjLdQHjsz2ifgbzagDoY7QvwwuUExY+uwMLSA5CAsE8N0X9aRo9GgBZXD70+orMkx+gDx
	 oNOMfREvvhnJXShro+4hoAk9ORMtqBSZuYCHJYrYLYEde1ciaY5IcVgJR5FVxSOtlbux2
	 m1OuKPPQv7GPbTZ8/78onD+GN7yHvsMqkadTsaEKpUpjyqtDjr9cgn90r4nnn+E6kVL25
	 81S2vRg/t8weNEOXZhnCiX6asJ1j+fckg9FAlCP4oCSHLYBIyDGQVolvwG/+gIWPCbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2OEdxY2;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B5606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 05:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2OEdxY2
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so11457745e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 21:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807049; x=1795411849; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OE8hBXnZhJ6GYouFE7YtTFL4tvumfnA83LbqqqWxZQ=;
        b=e2OEdxY2duj5ptSRVqi2Bg0NObTFWYZvr24TUMu8rBSMuzRqhS90h95y0uPPd3r5/X
         nW+/GbwsQ7PKTTxiE/I635BPtilQ40zjDZfIQyYE1KmLrrlfDPyktsIO3VCFALCNctB6
         +HhimBSMY9btGGcrP/ywo1z1Gp4yt2RDslLW4KZ0XdcckdHmMzeqsC+UsEUs/M9QT6RV
         TpKKqtUMQv1cDRB/QrSf4ziU7yvTaWtSZs2ugCW2duBsnPeMTb8DuaskXG32R6Bf0Svr
         e09THR/qCEI7UrdB40WiAg9yGEDzNRVFDAh4/8+eCva8nyk1kUuuPLgMDv2zcEYweAOD
         5ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807049; x=1795411849;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OE8hBXnZhJ6GYouFE7YtTFL4tvumfnA83LbqqqWxZQ=;
        b=TlRVFVbnORB+g0tVb5IfqJrmcDtoi7nVkesGNdNRTQxWmZX5o1vie/LsoriDNLbHjC
         QB7eJWeIBZKCyON9BhbegoCciOQBVtRvi4B6P6o6Hqh6QeIVtZGKpo5nGhnfx5q40EiE
         14H2a3XfVZFqjXRhbTlPEG4kHmMg4VaHu7wDpZc21TcqazAItek+r3cvhSKv0km5gb/t
         5Um1Rs0b/z5gsuAvW5b+5x8zXW3wMDV+j5JoNCLZenPEa0vLbzum04L0f2xtE+XhGPyH
         vbZdNLSBCxEP/MgSyVbhcXKj/paIO/9SydJMUgCdzBw6+VkHElme7f4gFYL9vgxTGSpN
         lTwQ==
X-Forwarded-Encrypted: i=1; AL+hErEg1d7KbHd8Xz5kJYuRjLOvbGB/8Qq63j9fwoEvXcBKvQ/aq1yOR58p6AR+roRm1c8u4yxOu/s8qdIgPGCq@lists.linux.dev
X-Gm-Message-State: APuU4Z+7ETmzQv+Eo/kxnsBBtyPgXCzTrxWyMa6Zzgt3Oc+w0qCN5rAW
	SnIbKCSva4viAlZUzw//Zr2TFTIb95DV2u7yUcMuvWaewtnSwpbR3e6Q
X-Gm-Gg: AYBFou1oSPWebkmGlG+D8AqUBOb+wwWLT235YyPcPp+2mVoxDAFjMvSlUL6TUmY3JY0
	0p0qzDFeZtBwsmOSjEhGip8UyXP97v8h9ez+iTInBeAV5bgVAfF/TWhoxCFOE5o/QYGJLbrFqc9
	DCoJ+8eh0fGc8VWBcFBqwrrQgw1chxQifwCVV1hFLyVyctc0/mPUTqiMNSOfkh48r2lkgFOmMCd
	JrJnYsc/LAUON+Z+y5Ks5enS4PaYavkZfUUv1MdwP5tqXnEZP4cUxlDXo8GnQWElkZy1MEpWek1
	iuyYix9JDrjSD+2KJgdSBNLNgJYsZ9YEn7CHfM2XBsma28Vn94Ae4yNp/svoEOJGr/NFnzO2b5Y
	HC2UkH3qwPEgEI7Ai7h8BJW1GJ/aLX6B8clrhy8gaink2D3doaYMg+lb19VLcNpTpQSR4kcdjGR
	8xspk59XxUWfsmj33Abj+U6KAetEASnjJJJnJhLK04zJO3bDcWFp7b+sUHRaKmoUj5IBIpq9gtH
	5rBQCCrhkzOQtE/m1IuKamSUxUaLcPU0tND/PFeOD8L4WtKG7Mqeeyp51n/d/1M3Cl1Rl99kPRK
	uMu0l+l33yLULv42UHrdNd8scs13zHeQqyPBPrGNAjrBzDEMw5Yimr56dRCXWh+IDq/qC4+zkNB
	NgU3mdEW5ZOEZWsdujyLEuDNJ8bwJ/QECPyEaTNCInXXFtaumGfJ0EeXW+7edkZc+kg2IwEc7Vr
	/Ebpn4ReZ1A2xk
X-Received: by 2002:a05:600c:8b55:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb55a02927mr190718125e9.3.1794807048545;
        Sun, 15 Nov 2026 21:30:48 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7292c04csm45018395e9.11.2026.11.15.21.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:30:47 -0800 (PST)
Date: Mon, 16 Nov 2026 08:30:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [broadcom-stblinux:drivers/next 9/22]
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c:1643
 vchiq_mmal_submit_buffer() warn: missing error code? 'ret'
Message-ID: <202611141218.5FZTnFtc-lkp@intel.com>
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

tree:   https://github.com/Broadcom/stblinux drivers/next
head:   0cab822bca7a59667774725b83e948b71462290f
commit: 67d0fbe47f8a03cdf30794ea8660a05dd54100d0 [9/22] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy
config: powerpc-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141218.5FZTnFtc-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611141218.5FZTnFtc-lkp@intel.com/

smatch warnings:
drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c:1643 vchiq_mmal_submit_buffer() warn: missing error code? 'ret'

vim +/ret +1643 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c

7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1617  int vchiq_mmal_submit_buffer(struct vchiq_mmal_instance *instance,
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1618  			     struct vchiq_mmal_port *port,
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1619  			     struct mmal_buffer *buffer)
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1620  {
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1621  	unsigned long flags = 0;
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1622  	int ret;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1623  
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1624  	/*
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1625  	 * We really want to do this in mmal_vchi_buffer_init but can't as
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1626  	 * videobuf2 won't let us have the dmabuf there.
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1627  	 */
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1628  	if (port->zero_copy && buffer->dma_buf && !buffer->vcsm_handle) {
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1629  		pr_debug("%s: import dmabuf %p\n", __func__, buffer->dma_buf);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1630  		ret = vc_sm_cma_import_dmabuf(buffer->dma_buf,
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1631  					      &buffer->vcsm_handle);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1632  		if (ret) {
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1633  			pr_err("%s: vc_sm_import_dmabuf_fd failed, ret %d\n",
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1634  			       __func__, ret);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1635  			return ret;
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1636  		}
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1637  
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1638  		buffer->vc_handle = vc_sm_cma_get_vc_handle(buffer->vcsm_handle);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1639  		if (!buffer->vc_handle) {
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1640  			pr_err("%s: vc_sm_int_handle failed %d\n",
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1641  			       __func__, ret);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1642  			vc_sm_cma_free(buffer->vcsm_handle);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12 @1643  			return ret;

return -ENOMEM;

67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1644  		}
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1645  		pr_debug("%s: import dmabuf %p - got vc handle %08X\n",
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1646  			 __func__, buffer->dma_buf, buffer->vc_handle);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1647  	}
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1648  
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1649  	ret = buffer_from_host(instance, port, buffer);
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1650  	if (ret == -EINVAL) {
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1651  		/* Port is disabled. Queue for when it is enabled. */
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1652  		spin_lock_irqsave(&port->slock, flags);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1653  		list_add_tail(&buffer->list, &port->buffers);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1654  		spin_unlock_irqrestore(&port->slock, flags);
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1655  	}
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1656  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1657  	return 0;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1658  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

