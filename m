Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032C2DA768
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777741513; cv=none; b=tiBHc6cPa+5lptCm/fysQEB27Vj85I8XyRaSOcrqG+Es749ec/E+gHRqwpbwiXESVny+lyQ41OboTEkb6mRXx/UNxfJTV0TPGmGcStLdX689dntLShEmEJnpFmy4MKn5Zo+Ueb+Vzki7MmW+SmNN+apXxKXyWAMk965zgPFDV2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777741513; c=relaxed/simple;
	bh=FdBVkyT70nLb57XfOr6JT3sFi3ZSJD39ANIk5R41Idk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtF5K3KdfoimW6P41BoBhgCSRgvbyV7JHwfhxACph9v2pRTlhRT0oh/5MkSZgdaVw8PMXhwFVodGJbiciDpyUHR2fXrW+GCXGi3N79zYWnsuUJkT1FR5wTMyABzWccDA1T5oXgdo5htmdwcxGqzu5VWkMqIQ8CHI+YJh8yJRrVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQvtBn1b; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQvtBn1b"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfd832155so1720358f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 May 2026 10:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777741510; x=1778346310; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1OvxfOGDImPDEvap085cD/4NlYHfKvABsDFeu1Dgyuc=;
        b=bQvtBn1bnlWLica1GcwjYRYSbtjvxtRkBoX9QrkZMn7xpuDHm6HSxCpiO/52KG6zrq
         jkTl6IUpQrR5/5LdbaREy0h50T09nkc+vdPqeVB95FVIJ2RsR9yixEx+aEMb2F7QqM8P
         wXRBiRC9ssBAhTkEvjHJMVb288RfPj2jIXfqiINyCA7KGQHAz8GhquQE2lKaI6fiaInd
         A58VhEkYmaaY28BS6islrhijLvqXxGAYX6yOdnNyzGNqzsTUkNkAIli+Wy8ed7ksRvfj
         jNbLqiSPu8Vf0CfxkMbb78iHXUvUG20UCCJkJQbAtCzrAJ78Ef02dw8jpOJ+elYumtlD
         fFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777741510; x=1778346310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OvxfOGDImPDEvap085cD/4NlYHfKvABsDFeu1Dgyuc=;
        b=ir0ZoW+3fgD1FnK8frS92cULx98JYXRmVp83wNsPwRK/q//UFTfa/UUB5JE/8Gk4IE
         epp1rpdS6m8z2CdmgqF6gvLVFuAKP63Akm9XN6gBSJ3H8I/5W33TNfHxyW8lAanXsZpb
         ehmktLgcrLIAJUc9At9MTwczmYcfsxXeRGbLtd+xhOPDMHW9QNhArP0HRll2yf6al827
         5V+GrcE4KJf1EXeNeujp3CYN4qNSbJxPpmvzW0RqJ6Q9Iw/hrQ873KN2T2TKvH3W5Xus
         aQiVC6StsSZB1qlcxPv7mGGG7H1bFKDWihluy9CJzJ6WVTNtGeoan6UKhCN/5x+zJ5tx
         gxRA==
X-Forwarded-Encrypted: i=1; AFNElJ+WF5E21ZwqOhWMdOHcw0jRKG7Xro96vRtJgabrlqBo5Dr6fEeSEp7StMHS5kSL1Sj22qWCO+xA7stpNEGp@lists.linux.dev
X-Gm-Message-State: AOJu0YxAXWwcjKFILakXI+3zYINjGSYsoPbIfUd91ceJX12VsBF60aVT
	18aI4NWZT5P2/AQiIHG51EzSWgymggZ8af4YdVOv9bImr5lzOTicftOD
X-Gm-Gg: AeBDievFkZxfLvLpuurC+p/hv/smPmO5E8He5ZyMvDeQBTP04QOq1DYc370GxsAdJub
	gZpX36XG2rRTOYdftGSTOwMBbE58Msq6aDfsWpJCV0CLbQdZXKvk9ARaOmlvj63iDb7Ry+eGRDe
	GJVfwbXsQf6/NpmsDoby3+7Rkyb8EgwCTvu/3ZAW69M4urCUQtBM93FInisdYelD0ntrHS8GX03
	I1LM/EksusjUTwux5r7TrsW9MfgQBhRYghvVi0mtIrmtyC/58CV4S+wWznRilFOos/e7hYuVchp
	dFe9tBAPeWPCDkC472HUZEMDSx2hFOV3Vu+6mEeSsbx114tgrPhixHf1qHxiF+ou6hgwn75Heyk
	Ag0m0V4d7q0kd6wYaPZrVmTQEob1uJDRfer4LgiA7CYPEhWRzwGv+gjLKF6O6puSOZrXd9NLknE
	HkbxK/Re1DcQkYEDpQhhQlPuldPd7OCg==
X-Received: by 2002:a05:6000:1acf:b0:441:2473:c30a with SMTP id ffacd0b85a97d-44bb5c425d4mr5958184f8f.31.1777741510282;
        Sat, 02 May 2026 10:05:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aaad6sm11422643f8f.28.2026.05.02.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 10:05:09 -0700 (PDT)
Date: Sat, 2 May 2026 20:05:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Tristan Madani <tristmd@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v3 2/2] wifi: libertas: fix OOB read from firmware
 bssdescriptsize in scan response
Message-ID: <afYuwVf23vKag2XA@stanley.mountain>
References: <20260421135027.357622-3-tristmd@gmail.com>
 <202605030019.lL8x0ZPx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605030019.lL8x0ZPx-lkp@intel.com>

On Sat, May 02, 2026 at 08:02:39PM +0300, Dan Carpenter wrote:
> Hi Tristan,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Tristan-Madani/wifi-libertas-fix-OOB-read-from-firmware-pkt_ptr-offset-in-RX-path/20260423-061353
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
> patch link:    https://lore.kernel.org/r/20260421135027.357622-3-tristmd%40gmail.com
> patch subject: [PATCH v3 2/2] wifi: libertas: fix OOB read from firmware bssdescriptsize in scan response
> config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260503/202605030019.lL8x0ZPx-lkp@intel.com/config)
          ^^^^^^^^^^^^^^^^^^^
Of course, it can't wrap on 64 bit systems.  But just do

	if (size_add(le32_to_cpu(p_rx_pd->pkt_ptr), sizeof(struct rxpackethdr)) > skb->len) {

I don't know if anyone uses this hardware on 32 bit systems but we may
as well do it right.

regards,
dan carpenter

