Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD546C853
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857852; cv=none; b=srMc/g0dqUebVNjizmgWpYvM6RlaoE/QvYhb/jg7ROsMrkUJX5pjyBoP6kR3I/68KYccvL2c3STcH7NJIBd6sjHZCZOcyFllLTfD3hCkZgA80x/O2oLXw20d5lVH7BIwyGg+b8Sg3ENy4KY7WQ98Xvl6euf7zzJ1biCY6LdGCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857852; c=relaxed/simple;
	bh=gjrVDFzMFPA76v231W8P+9Ba4GP9F9+nK7yh6nwf4vc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CUEgciF99TSbV7TBjpURqca1KzaFZwX+TmcRtd+Yiny0R6sjCTx7PBJGp5x6xNbpxu/JZ9k3y0XyXPUHVIuil79k711W2KqU/ZQ+BsN9Ljy4YNK0eR8TQ5zaxWjad+cAyX2BnxTjPZOUKLkCISFlDpsTBvGYRpHdK9hLu6RU6yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ikjjrtWP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ikjjrtWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785857848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjrVDFzMFPA76v231W8P+9Ba4GP9F9+nK7yh6nwf4vc=;
	b=ikjjrtWPEMzvLjOvQbhlxM1/5Pv4LCOYd6aid+G7UebGMM0IcN6Muq+rSeMV+mSqkYjMZd
	nheo+IMy2nEZFkw/h7gqo4VU6ZXNqBKnlpv2O1n6speiHG8TrI3wPS5+oMtRaa2meHDxnQ
	V3dBImigWxGeekgOEH3Bwm8Y6ymyO58=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-GQa5PeB_NgS1ZW8MA_yEpQ-1; Tue, 04 Aug 2026 11:37:27 -0400
X-MC-Unique: GQa5PeB_NgS1ZW8MA_yEpQ-1
X-Mimecast-MFC-AGG-ID: GQa5PeB_NgS1ZW8MA_yEpQ_1785857846
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso326096d6.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Aug 2026 08:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857846; x=1786462646;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjrVDFzMFPA76v231W8P+9Ba4GP9F9+nK7yh6nwf4vc=;
        b=B+cYqrCcS3eHI4H/B2gm3satxxn7gPvYSM+4RtSxL3/ODMZA84Rg9V8B6r34KufL4D
         s4qD+goE8YmnHE4QGoP5Iwse5cdvajtL/NZ2Q/tQXLXnQfxGA/Kbh7xPnHlvhUrGmLQl
         4HvdixLPkd+hS9hF+I0SCxdUAvmee9Joj8soG3JmGM++q6q+IG4aYWjHetEHXF+jgxiL
         OEok2AfvCNq36atf4Zhit8rKrFMk5m3q2LaAQt12but75frSF96BsHK1jnPEuQqKKa99
         gwOEtUUyXMHSsMI5H3XC2NoLM2kfOyltn5KUrl9+M/HR2sukL15tMh1iuQFR8Tu+uPdn
         zFWg==
X-Gm-Message-State: AOJu0YxJZchXtMEHYB0NU47Ub3JT1zgvTqhk/dBYg1o+iX+KaNP/Eunc
	PxyMfiAXnnnEtdcxNRakuCULWrHW5yaxn+SqbVrL3dVDHhfpnDrAg4SJ61MMNJ8EUJlIgi4DKgN
	y4BtxA3NveWewxsnwctyjC6uSDf2kt6GmUu4Ifnygmb2VoHATBFqrts8MPgihB8AT/Z4=
X-Gm-Gg: AR+sD11lvkgYKrS7K1RnpxKtCVnfpevtYmHLQgnK10K8HoW8OXQ+lnLEoZn8zWZVRQ+
	vbtBi8811jzBnGBo+vl0kjQ6ilx2L91BMwEzoSGLrj4I1e6czHvKlwsyMxs9aUwCSvmPA1BvEUX
	3W0dqDUkp+cBBLmRg6inOSGokMkL3vSlSjLed5c5GHd4OB8FEw5YS1Yw1VWFbEfbjW3dT7CiCkx
	ga+08KcWv4HkEECyyLoQ3qiW5ljf43HerfQsBiMMogTXTwfntMTNpi9cT++MmYPa0Kp8CxUjGRr
	onJwaRMH/I9JWnTrZxGjLoHe9cRhBigpyg5ewAvCDbDMnnq5Xl9ssiLoYWZ/HyEn+4An2jNXnWq
	+RZoL00b71ifNxa21bqhSPDV8RTdbsEOnXk2b
X-Received: by 2002:a05:6214:493:b0:8fd:b96d:195b with SMTP id 6a1803df08f44-90872c2b7cbmr80415956d6.15.1785857846420;
        Tue, 04 Aug 2026 08:37:26 -0700 (PDT)
X-Received: by 2002:a05:6214:493:b0:8fd:b96d:195b with SMTP id 6a1803df08f44-90872c2b7cbmr80415046d6.15.1785857845790;
        Tue, 04 Aug 2026 08:37:25 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:dbb1:97f1:a6e6:766b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908800cb9basm3648296d6.45.2026.08.04.08.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:37:25 -0700 (PDT)
Message-ID: <fa5e8dd1591ada95ac3e7e371852d9d68cd33cd8.camel@redhat.com>
Subject: Re: [PATCH] scsi: storvsc: Support manual scans for all Hyper-V
 targets
From: Laurence Oberman <loberman@redhat.com>
To: kernel test robot <lkp@intel.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>,  Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li	
 <longli@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, "James E.J. Bottomley"
	 <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
	 <martin.petersen@oracle.com>, linux-hyperv@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 04 Aug 2026 11:37:24 -0400
In-Reply-To: <202608032058.OkCwuEDu-lkp@intel.com>
References: <20260723151458.872265-1-loberman@redhat.com>
	 <202608032058.OkCwuEDu-lkp@intel.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f4L66wQyO59RofAJy06pg0PZWsW0mb-7ZN1u4fEbFL0_1785857846
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-08-03 at 20:45 +0800, kernel test robot wrote:
> Hi Laurence,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on jejb-scsi/for-next]
> [also build test ERROR on mkp-scsi/for-next linus/master v7.2-rc6
> next-20260731]
> [If your patch is applied to the wrong git tree, kindly drop us a
> note.
> And when submitting patch, we suggest to use '--base' as documented
> in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Laurence-Oberman/scsi-stor=
vsc-Support-manual-scans-for-all-Hyper-V-targets/20260803-141419
> base:=C2=A0=C2=A0
> https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git=C2=A0for-
> next
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20260723151458.872265-1-loberman%40redhat.com
> patch subject: [PATCH] scsi: storvsc: Support manual scans for all
> Hyper-V targets
> config: i386-allmodconfig
> (https://download.01.org/0day-ci/archive/20260803/202608032058.OkCwuE
> Du-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20260803/202608032058.OkCwuE
> Du-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202608032058.OkCwuEDu-lkp@intel.c=
om/
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> > > ERROR: modpost: "scsi_scan_host_selected"
> > > [drivers/scsi/hv_storvsc.ko] undefined!
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20
>=20
> Thanks for the report. This build failure was against v1 and was
> fixed in v2 by replacing the unexported scsi_scan_host_selected()
> helper with the exported scsi_scan_target() interface.

