Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE8220F085
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741003656; cv=none; b=aVUAQu2zhoKPvkf+oQcFz8vS+ilTUM3RimZamphICj74lnIwiqO0KP1lDEBBTm5e+rQqI4C+U9MyAD2ihU+T9sANb9fxAJt0kQHwKxBdkU4NI2AXyE0KO/6Ml3rf9yOCEugAFQ63eXmX6JJs+E5/ElQERRcq8f5hfjlWh3z4ZTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741003656; c=relaxed/simple;
	bh=uju7sIH5BGh5W5JTJZHooDHmsXtbGtIZ2zwKahZ89tE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYmNRpbCBNrNiJY4Y2kyC2jkkcGOiwCUtqRkHF8ORkZSpcrr13u/ip2/71VjqXF2yWw29cSpzxXLoGFFrDEG80GGibuW7wG4t90OGiae20Cto2i1eSNVdI5Ryz1mjETeoqYxLsvmfY33qdPZ0r2ZqFDCYoYgP4p/aZ7wtckcWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TG+TXnjx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TG+TXnjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741003653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fw9/y9pO0Tgw7qMRxrC2z9OKO7bwRqJ7EcWxU9xvHxE=;
	b=TG+TXnjxzzHEMgjapmsDMzczAnkMiwQHXrv19XeO9TPe8yBZAL//M99STrP7zt2nqBNKXv
	FeVv9eF3PJu8bKegK4UGOlxrg8A21FNEXY0oFI7t+oKzC1gPk04bJoePYnmjWTKenaxCQl
	I1b11mPDThTLFuWPH5L+c1/rEmL31lg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-kku0Ea1qM0658EAL0ZVUlg-1; Mon, 03 Mar 2025 07:07:32 -0500
X-MC-Unique: kku0Ea1qM0658EAL0ZVUlg-1
X-Mimecast-MFC-AGG-ID: kku0Ea1qM0658EAL0ZVUlg_1741003651
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390de58dc4eso4030991f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 03 Mar 2025 04:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741003651; x=1741608451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw9/y9pO0Tgw7qMRxrC2z9OKO7bwRqJ7EcWxU9xvHxE=;
        b=WQCzSSt1RfLB2OygtJle8FawCvnqjg2JLRR/irtnSLWi70oqrnAsCV6jMyiB5II1SE
         OZJtKZ6JDEa00ZdLeKe0Q6qcKxvVpGdZk+hEb6wEP7AU6KQxBoSfG7s8WUdLGyLY8Abz
         NE3WZxe8zNbg8n7mbiOK4ZpDSFhwCtISFq6PKi0jYi3AmpmySO6Cic8AVhvo+lJqlkOv
         N6vgJG/muN7gusALAgxiDT3xjhpSvQciII1r+QPTtw3CgXhWhkR4IULQIRLpeGCEsl8t
         veT6ZPxYGlD9DRXnvx5W8xtoR8px24+wuCUEK0iW16PJ8enGrL0Cpq2JBZwuegvMEd3e
         6jcg==
X-Forwarded-Encrypted: i=1; AJvYcCXz7Tf/sowdVcXYZeHdoe4AlXXxCw+1UyADIxqu37JTVcQVFuOGWmimxZw2bvDFOVql6EWvZt3efPwPPG3a@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgx8ZhsLaU3j9Lisbf7mREeYUN6Gg4TdB7RahED9hw7G+8EOI5
	kG/B/gWn8CbvPZzf6c+BSMZZJalCmd8nAa1YCHieKNVsJaXVaCcdlHvtJ2HofMtNAhxf8UlPnGw
	PT1fiYYyWF+fCQk0iBdnIXF4LzNJ6zSjPX36oFQ0sb8LWHG2T9PdiVZAxEhdPWCzu0DdsdE6Lcd
	+4DR8bHDfBNyoO0Gn/PlW4CiSycoLsQJljUQfO0w==
X-Gm-Gg: ASbGnctR39tOzHzSbBTnhrznd4LkXMMUoPxwtNciDBMXdIcw4ZGWmNbQm2tsSZs2Qw+
	10PbnFmIH770LIHVoLnkR4o785U2Xu9N6b+Ajq8iu7DNLlK0/64O+libruKHw0mDpPj/2RTUT
X-Received: by 2002:a05:6000:1543:b0:390:ef45:1a37 with SMTP id ffacd0b85a97d-390ef451caemr10434826f8f.55.1741003650995;
        Mon, 03 Mar 2025 04:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQibAQBZKGLMDrS/FjVYTrJktgwlJ/8V2jDfRODdesJgHBiBswiP6BF/IeHZ/V6AALHag0O/R4QLX3SW+KpHI=
X-Received: by 2002:a05:6000:1543:b0:390:ef45:1a37 with SMTP id
 ffacd0b85a97d-390ef451caemr10434799f8f.55.1741003650538; Mon, 03 Mar 2025
 04:07:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503021436.STomlZOE-lkp@intel.com>
In-Reply-To: <202503021436.STomlZOE-lkp@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 3 Mar 2025 13:07:18 +0100
X-Gm-Features: AQ5f1JoWiKKm2LeQHKrPeE63Zh1-iaGQM-Bm15TiuDzT9_6uJl3yL4GkD6PHv6U
Message-ID: <CABgObfYnELV3FjMgZRASi4p6Hmp67yBLJngyLWbbp23czhHFFA@mail.gmail.com>
Subject: Re: [kvm:kvm-coco-queue 20/127] ERROR: modpost: "enable_tdx"
 [arch/x86/kvm/kvm-intel.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org, 
	Farrah Chen <farrah.chen@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IY0CXFNz-w_BIK_MuWJyE3xYsIn7D5W49IQMNfpBXGg_1741003651
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 2, 2025 at 7:25=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-coco-queue
> head:   9fe4541afcfad987d39790f0a40527af190bf0dd
> commit: a58e01fec9ad144302cd8dfc0b6524315cdb2883 [20/127] KVM: TDX: Add p=
laceholders for TDX VM/vCPU structures
> config: x86_64-randconfig-077-20250302 (https://download.01.org/0day-ci/a=
rchive/20250302/202503021436.STomlZOE-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250302/202503021436.STomlZOE-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503021436.STomlZOE-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "enable_tdx" [arch/x86/kvm/kvm-intel.ko] undefined!
> ERROR: modpost: "tdx_cleanup" [arch/x86/kvm/kvm-intel.ko] undefined!
> ERROR: modpost: "tdx_bringup" [arch/x86/kvm/kvm-intel.ko] undefined!

All these failures are solved the same way, just

diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
index fc013c8816f1..e8a3657d716e 100644
--- a/arch/x86/kvm/vmx/tdx.h
+++ b/arch/x86/kvm/vmx/tdx.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_X86_VMX_TDX_H
 #define __KVM_X86_VMX_TDX_H

-#ifdef CONFIG_INTEL_TDX_HOST
+#ifdef CONFIG_KVM_INTEL_TDX
 int tdx_bringup(void);
 void tdx_cleanup(void);

Will apply to kvm-coco-queue.

Paolo

