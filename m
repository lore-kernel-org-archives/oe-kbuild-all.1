Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C370D272E63
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532337; cv=none; b=O7iAkMZaok7ynM3hcI31ZqHRZhN/kTKgPoeL0o7zIbgh6UPjK5Ne54LH6kQcvy0FMhRNg58v0m7YDlUHHwoet+aTfZzszajeZmGqZWhtwlyohHHFmXNlkds1cPU4B3Q2V/jXWvb2xIjlzg10gNdgFWZcUUAC5Fu6O4r7sWGlmD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532337; c=relaxed/simple;
	bh=/MVuEHa/23Qv0C/9OdlGj8X2onOeVc2HZ/vE5ohBEY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDw5daM3nQuNaEqEdd0EMZ1nadxi+zwJsv+nYy5w0sluD40h9ZWcpCdXKhZ4mt9m8LvaHni6Py67vR8wqwRhykeipC9zXHlBts7N55WqNQnNcWG1VbNQ/Pd0fA6kBm73NAg6yC57Y7uzuzWWs+gBcIHrT9zdFpZhNfxvBcaq+4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so1586019a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Nov 2025 08:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532333; x=1763137133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYdiXEjVampZ2jSiqSx9tYyz7jq/QUvexI5w408e0Dk=;
        b=e13OD+IW9E/ZypiTSZKXgRiHFKOffEZS+aNTS09BinZB1JRxym8HXQJL/sjMwzQD8L
         kxBaT63yEWSJoF+lfVLdt5hFjwwQPFzC4+WLlPaAFok46NvCdqEvY+60LW/EzqyvRX/w
         ksdUDimZcsAJAIzQKP5C49/OuuX1ZJzVJygXqqehK7FWz7JUgkKQk+wUGPoJfCJ8aK8L
         EAT4f5SS5Pacbzvam15m2gOnB608EBe6bULWaAKtm6rDN/y0mUUcZW5Dtr+Rpr9P4Sr3
         4xcQcqVhX/ZRHn55GRwVMTme5jyNR75gpMXOFNDjb+tHMkoGECUX4Wu3bjc5ulfNW//H
         qZOg==
X-Forwarded-Encrypted: i=1; AJvYcCXQTzEd2FzTTcWRwigEZY3cgz5lvZriTpLEEBJa/iCKyKvArtgz0pwUkJ2LJ6K7lZSjVeZxQETWKYAlwO9l@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9QmYuepfy3bdMYwfiN293/JtaGFoi9sREJrQ6wab8UH8Hsinx
	kmMlsIq5i28ELJeDHARTRr8C2AQucggJi91//LtlQrB6ug035ndlbkV9Ru+epg==
X-Gm-Gg: ASbGnct3UFaQzkBWH356dpRlUT69WJeENoPUqbSuKNsvkIPKjypgcpnUicS965m4r/D
	bHdO/yCX/uGkOdi7o/i8ai38l+m/J2Xc8kdxoM2pfzxArijhbwUsQ6VfkCIxbu2PlcevHRzg6Wl
	IEleNEA0uRHUUNuYUiVcz1Lu5oKpoGOlg4OOu9155xaUX7SkadFsXx2wJ8y6dtV+2Dqd8q4i95G
	nHsJithfrEnz6A3+UaPRuGjnsXs1PZWqP2unp+TA7HyUuA9ozyQZTRC2dnMWWqg03Z8rcAJGSRU
	idHcuTtyJQH+uURBPQPDwAeeI41bNbNEoVh41zK/3Y+z1IOtBydIIP02Udl3d77+9KUs3/gEM+2
	VWS6baxI3Q7vinY3FZkfs3/c7d4TS+8RxbHhWajyitIqYtNhqlhyj1+dMDsFxL/+Nn7o=
X-Google-Smtp-Source: AGHT+IHPJ69JUqZgdpNF0p+3fZhOjmHXGs9AcN7Hi5uAvwr6NOYxLUozjN0/kKt6el2+3CrQcxSHkA==
X-Received: by 2002:a05:6402:51cb:b0:640:b643:f3c5 with SMTP id 4fb4d7f45d1cf-6413ef04f4emr3649289a12.16.1762532332712;
        Fri, 07 Nov 2025 08:18:52 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8141e6sm4596289a12.15.2025.11.07.08.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:18:52 -0800 (PST)
Date: Fri, 7 Nov 2025 08:18:50 -0800
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <lkp@intel.com>
Cc: Ma Ke <make24@iscas.ac.cn>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] EDAC/ie31200: Fix error handling in
 ie31200_register_mci
Message-ID: <k67mlei5ja52oq3txm77poyhwtq7rakfhvcbvxi2guhyzappji@a726bvtwcmkb>
References: <20251105022146.22105-1-make24@iscas.ac.cn>
 <202511060427.k5gEuYdp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511060427.k5gEuYdp-lkp@intel.com>

On Thu, Nov 06, 2025 at 04:55:26AM +0800, kernel test robot wrote:
> Hi Ma,
> 
> kernel test robot noticed the following build warnings:

This should fix it:

commit b265162b5f9ae2a5f0f2cf8c312b3bbd1137f34d
Author: Breno Leitao <leitao@debian.org>
Date:   Fri Nov 7 08:11:29 2025 -0800

    EDAC/ie31200: Fix uninitialized variable 'priv' in error path
    
    The variable 'priv' is initialized from mci->pvt_info after the window
    mapping succeeds. If ie31200_map_mchbar() returns NULL, the code jumps
    to fail_free, but in the original code, this would execute
    put_device(&priv->dev) before reaching edac_mc_free(mci), using the
    uninitialized 'priv' variable.
    
    Fix this by moving put_device(&priv->dev) to be part of only the
    fail_unmap path, where priv is guaranteed to be initialized. The
    fail_free path now only frees the mci structure, which is safe to do
    regardless of whether priv was initialized.
    
    Fixes the Clang warning:
      error: variable 'priv' is used uninitialized whenever 'if' condition
      is true [-Werror,-Wsometimes-uninitialized]
    
    Signed-off-by: Breno Leitao <leitao@debian.org>
    Fixes: d766967335 ("EDAC/ie31200: Fix error handling in ie31200_register_mci")
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202511060427.k5gEuYdp-lkp@intel.com/

diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index ea8fc0d5f347d..4c6396da3603a 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -527,8 +527,8 @@ static int ie31200_register_mci(struct pci_dev *pdev, struct res_config *cfg, in
     return 0;
 fail_unmap:
     iounmap(window);
-fail_free:
     put_device(&priv->dev);
+fail_free:
     edac_mc_free(mci);
     return ret;
 }

