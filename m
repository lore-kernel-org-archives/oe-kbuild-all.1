Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0F31D36F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616173; cv=none; b=Dfirwl74OsfINPIQ35zTd6bW1pjYXLrIGzzeW8gvj4vmB1qFNT37DUufIhqktmuxkjttw81LkJpOLHCjXJ30hDjRzKV2UNiHIiPp0bWTxCAGX9eLoJSoUc4quDnsg6D5cvs9UuBca497VlzWLQOnCF/lsisxrc9XA1oH6oAC8Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616173; c=relaxed/simple;
	bh=/RR/U7qjyLInx5I/uwXMxNivKnihvdkWrEIVwHz7Eq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orMePhF/nf8k44AqjVnKXVEaX3tWftSM3H5Rs7Y2gy1rBnoGHr8peR3VLYhkBINjibzseBlLnoND8AAkWbkHyzkhLflo8b6j3LkbgWDC2fnvmNc7XPqOq5Wzta05BiTrf8g12BEPdLEMIZhlXEfB+Go/MN75FnGjNOKqApVD3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfxqGvrO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfxqGvrO"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee1317b1f7so2608494f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758616170; x=1759220970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4H3efbdSwxqDOTY4ewV+hCqf/E/cTKwJvAAgRINhHQ=;
        b=zfxqGvrOoWafkunwnLYAgKrXT9B4nIFd3Y6bRtbZErHjVxv0zOMy7e36XErNe+7OvR
         FaKR4TTUNa098hYa23KIcijgtPyxB9Ls3RuOrV7/ee87XKqwfGaGIr7hoTOlHpqCmc5T
         1PrfOeAiAlQ6GbS+Of18Kjd5Fcu+Lkf8Z0gQXGMz7V/cbcQ6SQxiU+Wi6Y7i/6RGcies
         rIHUzHDye5lF5snwv2C05qFHxe2NC1jIp0kkC3kwx/Vn37TCLAjWDm9hSrQTqMK3786n
         T8h5Qp7cITANPaAFJe2dOEHolL9eZ/0rXcoFlw5lGxoW5/iuzDwbto03A7jfrmxB5KGB
         2Suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758616170; x=1759220970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4H3efbdSwxqDOTY4ewV+hCqf/E/cTKwJvAAgRINhHQ=;
        b=mDsKV2cB9OmzK1HEoo2DRhcXkgPaABlbbwSReozlfhbi7xPPy151H6loSOfLlZMDFJ
         ultGNkobcHP1+KR1aAD8joi0W4E1CLAOVOpKHAQzRdM7c2F8aMwhGCF/SIMDbXhQWkMY
         azdaOZNLYZZq4bqBQVB2r1MqxMjFtDaNwsWfO8p3A8v3C/wZ08aVFUHvYocdN8/DWcNm
         Jmmswqu0zxZqbsnMdptkI0DTpxLXJgduONCFEl09BGV1JI/aSmLrAiFFIFxhPigAMHes
         Ziiyiu6e3iCie+VWDnkC1JXE3E+4rpWwhktBGNA3eXfwsVMnnbnvQEpLY3VP3rM4QHyK
         vUew==
X-Forwarded-Encrypted: i=1; AJvYcCV6KNKCnwA2/WHfT9WX46tgyJmifjQXw03pZ4f1MIiO6wPnFm9Aov3jJ9hpKKSgtVJye3flhiFYPeu9oY/x@lists.linux.dev
X-Gm-Message-State: AOJu0YyqMHNZ22S7a6A9bQtsYNLVWtPDkaWs4uhT7oipUU121PyvOtlg
	PIHVi8kEuwPZnfyuge8MVfNz25sAhZ+Ub2bZZTF7ARN+kZmeNlgxstl/CoEXfhAhRTg=
X-Gm-Gg: ASbGnctoplZojqnf5HRqQrAkXG1adDB7mrbCmwIdPqOna9HaNzYejjacCImvliJ5lZK
	zLN3C06+NBD4H3jCwTJi1z4pFABayTnES8LbHhYIwee3WlkGdPdiPJ42WBBnsmq75N9IFujpKHZ
	x408JgNXsImf26adWP5SS+C2JQGwtbP1+XLrJzCyI2xamt7kHQ5eB+d42O3rBKrCBSSHos+zonv
	dLaQVdiTzNzU777Ilz5Bgrg3w3JmQk67fnh4OEXZdKC4/rOTLIJxTTNW+NZNwn982yx7xZQ17vm
	8zcITRUcHerkrZM71Cw2153E2E5CaPrTtF0+WcWU328tNyoXK88mZRHTP3f80sSlJCHqsQlhG43
	0mgA1dfulM4AyS3qP8ch8sQQ+MmGiSsFP5JIUHAQ=
X-Google-Smtp-Source: AGHT+IHsvSUzwkgJMr2fuGf+beelXF7ViUccT9vVETmtAg6567gvGPlf85mOeUM7tJRvmp045Lmkcg==
X-Received: by 2002:a05:6000:310f:b0:400:6e06:e0ae with SMTP id ffacd0b85a97d-405cb5d27d8mr1308843f8f.47.1758616169814;
        Tue, 23 Sep 2025 01:29:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbfedd6sm23425761f8f.60.2025.09.23.01.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:29:29 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:29:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ruben Wauters <rubenru09@aol.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	lkp@intel.com, oe-kbuild@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/gud: fix accidentally deleted IS_ERR() check
Message-ID: <aNJaZldQsfTtOBa5@stanley.mountain>
References: <20250922173836.5608-1-rubenru09.ref@aol.com>
 <20250922173836.5608-1-rubenru09@aol.com>
 <a8e2ce0c-0aed-41b6-9856-acf62f60551b@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e2ce0c-0aed-41b6-9856-acf62f60551b@suse.de>

On Tue, Sep 23, 2025 at 09:57:11AM +0200, Thomas Zimmermann wrote:
> -:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately
> followed by Closes: with a URL to the report
> #15:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> 

I've been meaning to add a lkp@intel.com exception to that rule in
checkpatch...  :/

regards,
dan carpenter

