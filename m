Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CE031077A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722564; cv=none; b=SFlp2HqC+1q3ToRofoRemakn51m7Dx3DS163pOZIqeouvFtyFyp0Sx3qUuLI+EGaHs6YLYrNxbnW/Cu1XRs5kzj0g/N47QiTMpkDHVKRbN0ejip8PA3oDjoNwqIf3f8C+VRtVLIxkq8rKq8Zq3ls9dx/fY/Fxp9+3IwvqmehTzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722564; c=relaxed/simple;
	bh=38Eo1P6RRDbm7EclJHqXCna4ukniZc5nALvl1JL0vdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci1nZvZwcVpe4tQQWUnftz2zwdtMIyX9yzEbN4euhDjzQTGSIBVxdZuIdsMv0lNtfYrSMbtFfN/OcoR5yDV+ELtjJndJb7UlO0xs6CiNndH1BQK/iHcSlnkH3QrxEub0PUPIeipk5XYEOMs51FWzNWGhySFTgBswGU7OTvoourc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IcVpQ3Pu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcVpQ3Pu"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a28226dd13so5592821b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 00:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761722562; x=1762327362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LID1edKT1JVB/T0mGZC8Aw5XEVCKHk0/2C+33wP9ZS8=;
        b=IcVpQ3Pu0OWyTKbTJ24Ji5jFVqQ/8dnHwucDk0oX+28AqLE1H9uSOlQxcgvXTpp/NL
         del8+yOPqU1LI0nh3n8wfKMmgXR61RxqNX5voz53EDcGL2NpU0rqIU+96iheFF7qFfoC
         z/ZsjBwKLb0igxruBLdbBoxH42xRfvpk0MfxCmAAoA/Eb+CrM4dQfsr9l5OLbdAUYutr
         5tsjKUcptoCjSBbpPbjHEUIPTX4m9W1SrJGVvy66TPtbVRHGQr6y8VTTejjIpVPeir6R
         ew+4XH2XdclEjNb8t8b0gcZqWLM/X4MwchquKgJhnSSvGiYOvPrfyapXYbdz7B4hgPBc
         xaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761722562; x=1762327362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LID1edKT1JVB/T0mGZC8Aw5XEVCKHk0/2C+33wP9ZS8=;
        b=mmlxU0F/rqF8BpTmvErNz5tKWz7LBvdJ3b8HeIDxwj6FAkDFYIbfj7OYB3/ohzrGs0
         lci9KeThThaBIDoKOWROUsG26ArmVMPPxAP5dV7dsucPdsTbQ3gRO2qwx1PrwxLTRaJv
         7FDDREeweMTDsV58iSd+Cd6Azo+YPtsSKcLU4sGdpRpJ9xEJ1s+hUsHZBEJFVbLmh1nE
         ptDpseDaz9ImxxhSlNp4g9JrZP7pHlAQq/WgzkFRLJxWF/R9Ib+804Xkg1Kal3wb5amg
         +3AYVmZjcTy54K0xRYxOVDpAEy7qSIGiKvbvUgKk0bjMZeMs2bLJPwmx3ik5eenpiNSa
         Klag==
X-Forwarded-Encrypted: i=1; AJvYcCXM319v9BdiqsRUkn9aOaVsruwYvt23gMlY9qXHqZw2RQ8XXRQ0iaRraU+lx48GZ5re5nIpDya/vA8pjekx@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkxe6f3ELOHmmPXEuk6XlYv3aV4nhzbsoSYC3T6l3AGCcLjxB3
	j+1kEARlxK8ZiuW7/WaEcjBuVaPvo4+5R4eoV8onQBoK2CodGCm7RjZILauQcXAf/pA=
X-Gm-Gg: ASbGncuqoAMJu0zUJRe7QozKs3X6OaLDAYP8KBlmTcMp3WDYcE/123+2a5bO3QlXWjI
	wyYI7fCByAsKZ0+frddRgMFsQ1S2XgjsDm7Ws7+aBDKlISqmgUglOA3zUU7qdDsvFRhNmunO0j2
	9LTw/Akinv0GgHn/55QdL/XNRNfcL4nrDLGlWwEKHj0cZ+sl0vsf4gY3xqwuaFSBnTYe7RoalQN
	Rfd1WRgeYSxrntlHw8PJfeyaL8PgBHVd9CXbK8fBbI0sliTBKVxdLeg/KYN2qNVAmdT9qDazOnc
	2I2bPEnOH+Zplrryxh9jH3IEtMg90XyMI/HlP6efMqVcpmWB/6ZcgCPdn/HnP56utNZ9Ka/OCSb
	62KRR8TDsB3g2dxt2cDAwt6NODdHfG8nw7gBayJLcDWSxHs0YrJxiGpJotTX34gXu06GVANkVoT
	rNDQ==
X-Google-Smtp-Source: AGHT+IEhdlp8hcgPuzis1yOLKf8mKDRjGcPPEyjXNdtjkDYKEEcpG2vOnMqPOc1m3K1HLryEF62BgA==
X-Received: by 2002:a05:6a00:170c:b0:781:24ec:c8f4 with SMTP id d2e1a72fcca58-7a4e2722d99mr1979822b3a.3.1761722562258;
        Wed, 29 Oct 2025 00:22:42 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41409f714sm13951002b3a.72.2025.10.29.00.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:22:41 -0700 (PDT)
Date: Wed, 29 Oct 2025 12:52:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [vireshk:virtio/msg-xen 12/16] net/vmw_vsock/af_vsock.c:2292
 vsock_connectible_sendmsg() warn: inconsistent returns 'sk'.
Message-ID: <w5ouuibeaodg45yai4kyi5sipltb6lgykthcngf3sw5xekzype@z4e3khjuevsz>
References: <202510291001.CGX6PpWu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510291001.CGX6PpWu-lkp@intel.com>

On 29-10-25, 10:14, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
> head:   27143c677cd93a347826a8702540f4b7cdb0d14e
> commit: 8d1fc26e2f13344cd4d4f0552d6f0eaaade83913 [12/16] vsock: Add memory sharing support
> config: x86_64-randconfig-161-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291001.CGX6PpWu-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202510291001.CGX6PpWu-lkp@intel.com/
> 
> smatch warnings:
> net/vmw_vsock/af_vsock.c:2292 vsock_connectible_sendmsg() warn: inconsistent returns 'sk'.
> 
> vim +/sk +2292 net/vmw_vsock/af_vsock.c

Thanks Dan. Will have a look.

Btw, this is WIP stuff and isn't posted upstream yet.

-- 
viresh
