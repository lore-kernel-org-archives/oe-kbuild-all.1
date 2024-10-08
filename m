Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0F1DF97E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397397; cv=none; b=I0q7UEbXRXRrCh2fM2OEKZMw13vJiTocFDr82Y6jdPCiBwbMf9+wsYB87JZwv16R5S5NKHHJoQR6kZ8NmLmXVmqW0s346VAVy1wl4FJe/kXnqrkWn7o7V4j0s+tpwGnUsyZ4MrjBZEePo8l5AX6VaFaK8bouzUq26viNPuCBJOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397397; c=relaxed/simple;
	bh=oovhDjQ+h+tGiTzVPs+Bd3Ctyp+vKbNtabnaRMLZ0MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8VKW57EN8t0cz5JorPu9MPoE6zQ7DmyIavSHKjYICMFKITIVDS0qTBQaNcYs8aEjFgNsGRMeW0MEyLcbnUs+gawU34TOgJHKsdQm3lKhz5DuFts7gTfnopSHQD3IkVl4Zy6YjlS80o37I10kL8DW4hfxZpkD1MBdfGNz8qxSgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwtT8cOF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwtT8cOF"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71def715ebdso2691390b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 08 Oct 2024 07:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397394; x=1729002194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3s0y0U4U/zNTntZ4JNtG+dOk0GuXy1+AAJizNLWCVpk=;
        b=dwtT8cOFMCDAEGcH4SmlSburhHgOaIl+IZ5lBIxBLBRkoq+STaCssAjxkaRm1Nfjnj
         glI+9ELCId9R3Vlks9hxMD4H/8YVqaFerY4mZ3j0y5WXuLqO7OUo2TrlUpISWTq66VEE
         /xy+xXnJh7+IdjZJ12Jao5AzvXUlyoCzlPeI3NtSlmWz8zUXPG9ywkRbxLyn7hLdes+e
         MNlM9sY/phKHnVu/JOggXLy6WywjJ96TkFtjCg+BMfq+jjaWv2QTT+CjHfGz3oBoTTK6
         2m6mVIibatLuhlGmdPKjfmyJnACpy3ZMe9mg7cqbHYNN+x/Q0GXJW00/n87FNtJCctNF
         LP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397394; x=1729002194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3s0y0U4U/zNTntZ4JNtG+dOk0GuXy1+AAJizNLWCVpk=;
        b=toJsbgskOd9sZeTI2jvWoIx6iLbgdFeq/Nh/rSCbZRurxpToUJa3xX4NrPFmuUXnw7
         hZ5hjzETVAuJompc2M/79roa3lx02BU7UUy4MeeQHiTU4vBtM8LcypJKT005ZfTBokdH
         R4qG+Y4KusH+lYhZL654gIoWA+1l2o07eD+Z09J7jOERJWJnGhI/y61WeT/wCPXxp1H4
         hAsve2b5aDMk87k1MO7T6dYrhZk/A2RlSqhYiXhhiZN9QGpD4qvg3wHJ6o2yci/k7M3W
         cYLw3aHxT2rX/swRpWEQOjMBMObaJxEBv65g+Q6Ei3aDtS9ASHGfj9BLJFh0SQ906DRu
         mh/w==
X-Forwarded-Encrypted: i=1; AJvYcCVKjCO2S/KIa/g4xFtZm9OO67cvuoUK4HOgBjvefC9+DiTeq3zRBkBZLe6VUfUOTYONSYHRqIpmHcXw/yiB@lists.linux.dev
X-Gm-Message-State: AOJu0YxVyofziuSX6W2cZ9M3VFU2T1BZW2AMlpKHmUkQFJ/Jk75Cjc0L
	hwBc/13Kzd7fDXGOgm//Vg3PKVkjurJie9KUgoDCS2it+HfELkJpUg57kGqtXY4=
X-Google-Smtp-Source: AGHT+IET4qjoJB1wWodF/QyFu2wMpdITwsro6eNAfvM/IE1PiYckOL2Jg39NTknxUkJQohIJiVZU3w==
X-Received: by 2002:a05:6a20:d50b:b0:1d7:1040:8519 with SMTP id adf61e73a8af0-1d710408630mr2986112637.42.1728397394539;
        Tue, 08 Oct 2024 07:23:14 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e3a0:1c0:95c8:8b16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd2a1bsm6168882b3a.85.2024.10.08.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 07:23:14 -0700 (PDT)
Date: Tue, 8 Oct 2024 08:23:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA
 to load the firmware
Message-ID: <ZwVATlRbo0OdRLbj@p14s>
References: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>
 <202410081902.TwQcmWjk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410081902.TwQcmWjk-lkp@intel.com>

From hereon and starting with this version, I will not review patchets that
don't pass the compilation bots.

Mathieu

On Tue, Oct 08, 2024 at 07:07:40PM +0800, kernel test robot wrote:
> Hi Arnaud,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241007-212358
> base:   9852d85ec9d492ebef56dc5f229416c925758edc
> patch link:    https://lore.kernel.org/r/20241007131620.2090104-8-arnaud.pouliquen%40foss.st.com
> patch subject: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> config: alpha-kismet-CONFIG_REMOTEPROC_TEE-CONFIG_STM32_RPROC-0-0 (https://download.01.org/0day-ci/archive/20241008/202410081902.TwQcmWjk-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20241008/202410081902.TwQcmWjk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410081902.TwQcmWjk-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for REMOTEPROC_TEE when selected by STM32_RPROC
>    WARNING: unmet direct dependencies detected for REMOTEPROC_TEE
>      Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
>      Selected by [y]:
>      - STM32_RPROC [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && REMOTEPROC [=y]
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
