Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38AF18638
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336293; cv=none; b=tcx/ojLWE61IlllZweO1iC7ALDTBFErYIRyb0li1BWjIUa1ZFMd9ukTqzA6OelXYqgZqwpAWhPT6y1+yUCcsJmffuQArAjNwD8yJpgX8Uv2E1wzlHH+2sITkxOqtikoE6Ln2Rq1vQixOzlZ/WapFtpMuxAKkMa+BApH7aEIq+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336293; c=relaxed/simple;
	bh=Dp84neu+vynjrTHf4i2W8jzAHHaFlisszl3hFMQ+ZCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hubvWkI7Eebr4804YBNcfBbmre0ENitCZoLPM9s65Kvp+urcFd0GVSalImckDaiKcRu+o+6XT1uctAeCpNOj3whDCAOGQbEJob9b3elEJFiJuHjOdLO7VyU1S/Sw2hgqNs/Hw4hieHjPiDPM0A5JYBNR7Yeda3CUJR9eJ27sdq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rgni9ADf; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rgni9ADf"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-502b405abb1so209688e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 00:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727336290; x=1727941090; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Sjsal3XJocRUMBEqC7eulF6D2Ki2TAvQnVssNUiGcw=;
        b=Rgni9ADfKFRDxXaPVacjribjix5G8dQrLWIhOsuPz4NIjdd+w5JmmGzeVJhhSRinnz
         ohz34VSarAk75LXarVF1MHjxS+anS4y/RqXTn3iGw+5DAv2zWOygEHBIseqBIMnswaR1
         FzaiGlsJN+tH+KFxKvHckpaRJvEEmVuHm9KkZNDyJVLgy5ZucjWg1/izSM96Pq5L6xhs
         UZJbGc39g6XFVH0PYT2AJ7gRu3+DxuuAyooce82S8h1zVsqIH/TUvf0claP0kytWcxjk
         NQOdWev8Dtme9On8i+lQgcc1u1Zf3AGH53j6kJ5PLFU5Ueja41pezCvPd5Fw+Wt4KNM5
         JAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727336290; x=1727941090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Sjsal3XJocRUMBEqC7eulF6D2Ki2TAvQnVssNUiGcw=;
        b=M14cAcm1HepeJDKpoK3S42som810wS9czInoFtWCdHJDemFghIQHOPVLhMLo7pPH7r
         oc5TxEb5mLSn0UJJsVi3rX+qqonuS99HgcEnPrLdbnL60iNwPdUWVwqAolT0LbM80wRW
         mGAV0nkObFRLMEmirDjKTlPANey0vGiTi2nPn7Odb4DTwjNqRHADd1RPcQa+ScCLZ0f7
         tOG7aAp/q0KVSgidDE/Aa8XfFU6Lq7TzZpX5yoshCjf7lh6x76m+RuxfpEld8gzvE7db
         1kGhGZRhC+OdrZBGucYBEZVOk1MUOunJrM9WSr+BnTni9YEGH27Gbl93T2iuCUogXiWh
         u58w==
X-Forwarded-Encrypted: i=1; AJvYcCW9w2kSMlO87jR+BRq8zCqCAP1/uZNKIPEKFyRSjv30E61pqC2EljXND6P+IW321/I1DYtnMIrmw2pNBAaA@lists.linux.dev
X-Gm-Message-State: AOJu0YzkcoJl8W5P1wIZlCqoX5HDkrUb3/+R5qw6jke3W/Xb2EamAw4O
	OSE03x/Krpb8YAqE3vXnFlfOuN4AHRccA59Q4KxPxRVH9v3AeaMChG4Nmx3Wcs53PhBVm7ov4Gl
	g+M+TI5rDFRNm7TIDEIZSgBfLFos=
X-Google-Smtp-Source: AGHT+IFj2qGMlB0QH3Dqyg4frcCkP6Mef6gndDSEa0u4i1FL0L4exkBq3DgOBe9Ju/ytkZ8G65IMhPNdYUkIInlXxsY=
X-Received: by 2002:a05:6122:920:b0:503:9cbc:1c9e with SMTP id
 71dfb90a1353d-505c19b3481mr4733943e0c.0.1727336290249; Thu, 26 Sep 2024
 00:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925152927.4579-1-kdipendra88@gmail.com> <202409261447.R2kfrGVq-lkp@intel.com>
In-Reply-To: <202409261447.R2kfrGVq-lkp@intel.com>
From: Dipendra Khadka <kdipendra88@gmail.com>
Date: Thu, 26 Sep 2024 13:22:57 +0545
Message-ID: <CAEKBCKOmtF8QFnpC_9rf-uKyLa6We_oR9UfuN4C-y99GLswciA@mail.gmail.com>
Subject: Re: [PATCH net v4] net: systemport: Add error pointer checks in
 bcm_sysport_map_queues() and bcm_sysport_unmap_queues()
To: kernel test robot <lkp@intel.com>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	maxime.chevallier@bootlin.com, horms@kernel.org, 
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I will fix this and will send v5.

On Thu, 26 Sept 2024 at 13:06, kernel test robot <lkp@intel.com> wrote:
>
> Hi Dipendra,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Dipendra-Khadka/net-systemport-Add-error-pointer-checks-in-bcm_sysport_map_queues-and-bcm_sysport_unmap_queues/20240925-233508
> base:   net/main
> patch link:    https://lore.kernel.org/r/20240925152927.4579-1-kdipendra88%40gmail.com
> patch subject: [PATCH net v4] net: systemport: Add error pointer checks in bcm_sysport_map_queues() and bcm_sysport_unmap_queues()
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240926/202409261447.R2kfrGVq-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261447.R2kfrGVq-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409261447.R2kfrGVq-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    drivers/net/ethernet/broadcom/bcmsysport.c: In function 'bcm_sysport_unmap_queues':
> >> drivers/net/ethernet/broadcom/bcmsysport.c:2401:35: error: expected ';' before ')' token
>     2401 |                 return PTR_ERR(dp));
>          |                                   ^
>          |                                   ;
> >> drivers/net/ethernet/broadcom/bcmsysport.c:2400:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
>     2400 |         if (IS_ERR(dp))
>          |         ^~
>    drivers/net/ethernet/broadcom/bcmsysport.c:2401:35: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
>     2401 |                 return PTR_ERR(dp));
>          |                                   ^
> >> drivers/net/ethernet/broadcom/bcmsysport.c:2401:35: error: expected statement before ')' token
>
>
> vim +2401 drivers/net/ethernet/broadcom/bcmsysport.c
>
>   2389
>   2390  static int bcm_sysport_unmap_queues(struct net_device *dev,
>   2391                                      struct net_device *slave_dev)
>   2392  {
>   2393          struct bcm_sysport_priv *priv = netdev_priv(dev);
>   2394          struct bcm_sysport_tx_ring *ring;
>   2395          unsigned int num_tx_queues;
>   2396          unsigned int q, qp, port;
>   2397          struct dsa_port *dp;
>   2398
>   2399          dp = dsa_port_from_netdev(slave_dev);
> > 2400          if (IS_ERR(dp))
> > 2401                  return PTR_ERR(dp));
>   2402
>   2403          port = dp->index;
>   2404
>   2405          num_tx_queues = slave_dev->real_num_tx_queues;
>   2406
>   2407          for (q = 0; q < dev->num_tx_queues; q++) {
>   2408                  ring = &priv->tx_rings[q];
>   2409
>   2410                  if (ring->switch_port != port)
>   2411                          continue;
>   2412
>   2413                  if (!ring->inspect)
>   2414                          continue;
>   2415
>   2416                  ring->inspect = false;
>   2417                  qp = ring->switch_queue;
>   2418                  priv->ring_map[qp + port * num_tx_queues] = NULL;
>   2419          }
>   2420
>   2421          return 0;
>   2422  }
>   2423
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Best Regards,
Dipendra
