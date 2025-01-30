Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AFA17A5A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 05:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738215598; cv=none; b=Uh0kglX/FtrKNhGLos+XBt0hzI/FiZwFQl9VLJz4EUCkKGqhFTl+fxLT8rUYfPzmoXUr2uWD/iLhsdmjDvVjFc6eZLhazvvzkeAwenf6P4M1/j3rAph0xGncK3k7rCQ++aldtyvqvss4Y0guK7YE6TDPuXTjNOosTzL7Sm+vsxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738215598; c=relaxed/simple;
	bh=k2TB9RI4DUrjT39n463CRE8WJy+MBsg3App0eKbjl2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ump4gVhu1WkVCTGosip1vt31UXEd/zDRrYaMfoRWYWpcnPp5mOWUStfXN/ZE5B+FyEe6lnVtU1IglwwBgHPs4scItp+XjLWk3+rEMmiB+tnRIKE6H3jYtuZzEE6XhuxulPtRxsd1DE++O8cbcrAEsxPYgkdSbjCKjRO5JFuba88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xcY/DbKO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xcY/DbKO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361815b96cso2062425e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 21:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738215595; x=1738820395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tawOs+rXlsMzCwf+LGEPYlHYgGznelnhxMiN2FkCFWk=;
        b=xcY/DbKOQ82dMHnC0eNXrxImTdQ57inwWraJZvB7UoSAgNy/eZwwdKLjdCum1qei9i
         FUv5qv0WjiOO+K4e+eLMdaB+ZDAAg4aLScpuE2E86OicxWN44y+lBY2Lz15Stq88kcLp
         WuuMi4siXJvzX1/731eMpeOZNr0irEY2x4Gycs3HuDXy8kSG/3w5HNZoaOXrTFqCk39i
         dCBcC3DaHYrMZSmszoWH27+ljwtBorzkt8UXJUc2EnikGmR4CkA3Nh2Yukct7w5lMk8M
         1xEcaOqMo1yHpduXk2KQvwOnNwtyV8HR9t/FteM2r87Mm1qRusba+Vj6yQ8CYqa+0cvi
         9FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738215595; x=1738820395;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tawOs+rXlsMzCwf+LGEPYlHYgGznelnhxMiN2FkCFWk=;
        b=m9bQCYP2VuDficfdxk7zHtBmNYoDKZmimz2mWTmMNadInY9Z6PctR5NoV5FRgn6TP1
         QJh4Jl2xngyU4W1W4bAT2vUnGIvt7zZdjYqGAhjOWzMjGXU+bKa89sJHqW+XMg0Efzf3
         9KyI11YlVzFiowzOZgnBwekKdhYf3p5Q0/gIk0f1m3BbnVpZ2F98H50zkSWA/n27bEeI
         mBoQ50l17sUt9xhtfuGR1zf3L4aetNU77CYHqdBqemcEZLqQz2lFS3hy4k0RmWdP8hU4
         pLU++kofOBCQenQ+brrLOu5ts2yNM+R8m8wXlPXsPHPreZVq2YfGs74wl9QP2MHvcypE
         CLPA==
X-Forwarded-Encrypted: i=1; AJvYcCWw2uYphQ2q4EMlaf7gsBib3L1FxSPZ/gz0PoNncQwCwwz2kkdP44RMs0+lh+AZbsTI8tyMldK8l5OXeHP8@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo6ucFPimMpozM3eKDk3NMrhwCw4pas4ieJ86EV/UtALph3Alx
	LdWshKyvP3wjvaXKlCfzrr4uP3OfBGAuiV7YzdBW9z5wh/fPf+L607ezNh2PTOY=
X-Gm-Gg: ASbGncuIWrZh0h3Qk7z0XpDKFynu4AwMorEZDvcRwTt6Omg2lR3bsGn82q7ABl2i9Xw
	PrUGmfAXTFR3/aI/TiFwK5qvgaDpujVYPw288tUhlcMGep9NvT1BBtW53W//DenrAhhAjNCql5t
	GdJJJL9ptMZ3HjDs/SnlpgysXH7dv2H32CNEFgaH2obbgwXDjdZ6BPDWcQFXpqYS1XzRAKbeam8
	scnp/hSfYC4y7gsdOvPm5JRjmZ+l7nPJQG38CKzbOLiMesaqHcbGlBJVnVR7jsEq4zaYKnTuHXo
	d3UFOm0sg8A4KeM+CeV9
X-Google-Smtp-Source: AGHT+IGkob8f5Rg4ltVari8jUgRwXDAeSVmbKqSg9q5LIabRwV6jxbIS5q51TZ7Z/+nr1pGS6FTS1Q==
X-Received: by 2002:a05:600c:1d1e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-438dc3bd896mr50750435e9.8.1738215595009;
        Wed, 29 Jan 2025 21:39:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244eb0dsm9882645e9.27.2025.01.29.21.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 21:39:54 -0800 (PST)
Date: Thu, 30 Jan 2025 08:39:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Michael Chan <michael.chan@broadcom.com>,
	davem@davemloft.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	andrew+netdev@lunn.ch, pavan.chebbi@broadcom.com,
	andrew.gospodarek@broadcom.com, michal.swiatkowski@linux.intel.com,
	helgaas@kernel.org, Somnath Kotur <somnath.kotur@broadcom.com>,
	Ajit Khaparde <ajit.khaparde@broadcom.com>,
	David Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v2 09/10] bnxt_en: Extend queue stop/start for
 TX rings
Message-ID: <8a4bcb57-ca1a-4fa2-95d6-cff55b41de44@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116192343.34535-10-michael.chan@broadcom.com>

Hi Michael,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Chan/bnxt_en-Set-NAPR-1-2-support-when-registering-with-firmware/20250117-032822
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250116192343.34535-10-michael.chan%40broadcom.com
patch subject: [PATCH net-next v2 09/10] bnxt_en: Extend queue stop/start for TX rings
config: x86_64-randconfig-r071-20250126 (https://download.01.org/0day-ci/archive/20250130/202501300808.5bqgHMA6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501300808.5bqgHMA6-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt.c:15769 bnxt_queue_start() error: uninitialized symbol 'cpr'.

vim +/cpr +15769 drivers/net/ethernet/broadcom/bnxt/bnxt.c

2d694c27d32efc David Wei     2024-06-18  15691  static int bnxt_queue_start(struct net_device *dev, void *qmem, int idx)
2d694c27d32efc David Wei     2024-06-18  15692  {
2d694c27d32efc David Wei     2024-06-18  15693  	struct bnxt *bp = netdev_priv(dev);
2d694c27d32efc David Wei     2024-06-18  15694  	struct bnxt_rx_ring_info *rxr, *clone;
2d694c27d32efc David Wei     2024-06-18  15695  	struct bnxt_cp_ring_info *cpr;
b9d2956e869c78 David Wei     2024-08-07  15696  	struct bnxt_vnic_info *vnic;
5d2310614bc883 Somnath Kotur 2025-01-16  15697  	struct bnxt_napi *bnapi;
b9d2956e869c78 David Wei     2024-08-07  15698  	int i, rc;
2d694c27d32efc David Wei     2024-06-18  15699  
2d694c27d32efc David Wei     2024-06-18  15700  	rxr = &bp->rx_ring[idx];
2d694c27d32efc David Wei     2024-06-18  15701  	clone = qmem;
2d694c27d32efc David Wei     2024-06-18  15702  
2d694c27d32efc David Wei     2024-06-18  15703  	rxr->rx_prod = clone->rx_prod;
2d694c27d32efc David Wei     2024-06-18  15704  	rxr->rx_agg_prod = clone->rx_agg_prod;
2d694c27d32efc David Wei     2024-06-18  15705  	rxr->rx_sw_agg_prod = clone->rx_sw_agg_prod;
2d694c27d32efc David Wei     2024-06-18  15706  	rxr->rx_next_cons = clone->rx_next_cons;
bd649c5cc95816 David Wei     2024-12-03  15707  	rxr->rx_tpa = clone->rx_tpa;
bd649c5cc95816 David Wei     2024-12-03  15708  	rxr->rx_tpa_idx_map = clone->rx_tpa_idx_map;
2d694c27d32efc David Wei     2024-06-18  15709  	rxr->page_pool = clone->page_pool;
bd649c5cc95816 David Wei     2024-12-03  15710  	rxr->head_pool = clone->head_pool;
b537633ce57b29 Taehee Yoo    2024-07-21  15711  	rxr->xdp_rxq = clone->xdp_rxq;
2d694c27d32efc David Wei     2024-06-18  15712  
2d694c27d32efc David Wei     2024-06-18  15713  	bnxt_copy_rx_ring(bp, rxr, clone);
2d694c27d32efc David Wei     2024-06-18  15714  
5d2310614bc883 Somnath Kotur 2025-01-16  15715  	bnapi = rxr->bnapi;
2d694c27d32efc David Wei     2024-06-18  15716  	rc = bnxt_hwrm_rx_ring_alloc(bp, rxr);
2d694c27d32efc David Wei     2024-06-18  15717  	if (rc)
5d2310614bc883 Somnath Kotur 2025-01-16  15718  		goto err_reset_rx;

cpr isn't initialized

377e78a9e08ce5 Somnath Kotur 2025-01-16  15719  
377e78a9e08ce5 Somnath Kotur 2025-01-16  15720  	rc = bnxt_hwrm_cp_ring_alloc_p5(bp, rxr->rx_cpr);
2d694c27d32efc David Wei     2024-06-18  15721  	if (rc)
5d2310614bc883 Somnath Kotur 2025-01-16  15722  		goto err_reset_rx;
2d694c27d32efc David Wei     2024-06-18  15723  
377e78a9e08ce5 Somnath Kotur 2025-01-16  15724  	rc = bnxt_hwrm_rx_agg_ring_alloc(bp, rxr);
377e78a9e08ce5 Somnath Kotur 2025-01-16  15725  	if (rc)
5d2310614bc883 Somnath Kotur 2025-01-16  15726  		goto err_reset_rx;
377e78a9e08ce5 Somnath Kotur 2025-01-16  15727  
2d694c27d32efc David Wei     2024-06-18  15728  	bnxt_db_write(bp, &rxr->rx_db, rxr->rx_prod);
2d694c27d32efc David Wei     2024-06-18  15729  	if (bp->flags & BNXT_FLAG_AGG_RINGS)
2d694c27d32efc David Wei     2024-06-18  15730  		bnxt_db_write(bp, &rxr->rx_agg_db, rxr->rx_agg_prod);
2d694c27d32efc David Wei     2024-06-18  15731  
5d2310614bc883 Somnath Kotur 2025-01-16  15732  	cpr = &bnapi->cp_ring;
2d694c27d32efc David Wei     2024-06-18  15733  	cpr->sw_stats->rx.rx_resets++;
2d694c27d32efc David Wei     2024-06-18  15734  
5d2310614bc883 Somnath Kotur 2025-01-16  15735  	if (bp->flags & BNXT_FLAG_SHARED_RINGS) {
5d2310614bc883 Somnath Kotur 2025-01-16  15736  		cpr->sw_stats->tx.tx_resets++;
5d2310614bc883 Somnath Kotur 2025-01-16  15737  		rc = bnxt_tx_queue_start(bp, idx);
5d2310614bc883 Somnath Kotur 2025-01-16  15738  		if (rc) {
5d2310614bc883 Somnath Kotur 2025-01-16  15739  			netdev_warn(bp->dev,
5d2310614bc883 Somnath Kotur 2025-01-16  15740  				    "tx queue restart failed: rc=%d\n", rc);
5d2310614bc883 Somnath Kotur 2025-01-16  15741  			bnapi->tx_fault = 1;
5d2310614bc883 Somnath Kotur 2025-01-16  15742  			goto err_reset;
5d2310614bc883 Somnath Kotur 2025-01-16  15743  		}
5d2310614bc883 Somnath Kotur 2025-01-16  15744  	}
5d2310614bc883 Somnath Kotur 2025-01-16  15745  
5d2310614bc883 Somnath Kotur 2025-01-16  15746  	napi_enable(&bnapi->napi);
5d2310614bc883 Somnath Kotur 2025-01-16  15747  	bnxt_db_nq_arm(bp, &cpr->cp_db, cpr->cp_raw_cons);
5d2310614bc883 Somnath Kotur 2025-01-16  15748  
b9d2956e869c78 David Wei     2024-08-07  15749  	for (i = 0; i <= BNXT_VNIC_NTUPLE; i++) {
b9d2956e869c78 David Wei     2024-08-07  15750  		vnic = &bp->vnic_info[i];
5ac066b7b062ee Somnath Kotur 2024-11-22  15751  
5ac066b7b062ee Somnath Kotur 2024-11-22  15752  		rc = bnxt_hwrm_vnic_set_rss_p5(bp, vnic, true);
5ac066b7b062ee Somnath Kotur 2024-11-22  15753  		if (rc) {
5ac066b7b062ee Somnath Kotur 2024-11-22  15754  			netdev_err(bp->dev, "hwrm vnic %d set rss failure rc: %d\n",
5ac066b7b062ee Somnath Kotur 2024-11-22  15755  				   vnic->vnic_id, rc);
5ac066b7b062ee Somnath Kotur 2024-11-22  15756  			return rc;
5ac066b7b062ee Somnath Kotur 2024-11-22  15757  		}
b9d2956e869c78 David Wei     2024-08-07  15758  		vnic->mru = bp->dev->mtu + ETH_HLEN + VLAN_HLEN;
b9d2956e869c78 David Wei     2024-08-07  15759  		bnxt_hwrm_vnic_update(bp, vnic,
b9d2956e869c78 David Wei     2024-08-07  15760  				      VNIC_UPDATE_REQ_ENABLES_MRU_VALID);
b9d2956e869c78 David Wei     2024-08-07  15761  	}
b9d2956e869c78 David Wei     2024-08-07  15762  
2d694c27d32efc David Wei     2024-06-18  15763  	return 0;
2d694c27d32efc David Wei     2024-06-18  15764  
5d2310614bc883 Somnath Kotur 2025-01-16  15765  err_reset_rx:
5d2310614bc883 Somnath Kotur 2025-01-16  15766  	rxr->bnapi->in_reset = true;
5d2310614bc883 Somnath Kotur 2025-01-16  15767  err_reset:
5d2310614bc883 Somnath Kotur 2025-01-16  15768  	napi_enable(&bnapi->napi);
5d2310614bc883 Somnath Kotur 2025-01-16 @15769  	bnxt_db_nq_arm(bp, &cpr->cp_db, cpr->cp_raw_cons);
                                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Uninitialized variable

5d2310614bc883 Somnath Kotur 2025-01-16  15770  	bnxt_reset_task(bp, true);
2d694c27d32efc David Wei     2024-06-18  15771  	return rc;
2d694c27d32efc David Wei     2024-06-18  15772  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

