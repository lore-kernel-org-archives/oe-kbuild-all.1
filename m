Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A7358388
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432681; cv=none; b=Ldy4VH5koX3sgYij5d0jETtNMM90WDMTS4DUCbdj6W4rM2G7Dlb0H/Dz45PSi1/9oWxoCC1hFKApUQFoRkv+D9Q6n8Pfbe1aKPz5ON9aVAmN3hUSkF5/DG7vVpdnkVKaqcLnnaSVPI86PZbkf6J7h4A4pwvBzpz/poBHF8aFQvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432681; c=relaxed/simple;
	bh=cn6CtRecj2EaLwpR7S4y/I/iCrHBJcghb35WFG7xfM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SxdqVsHIS6GjYQDHMTE/A5k/ZmPhCPqOMeYeBxs5WyjQy9B21kZLNKm5EpZudSJH5xlZlFRfyG48DVmes2KpKCkJHp9NFFzNQ8vejuAn/T1gOwTT+XuAk38CuuY5BV0JtDdvPupbQL2/04CPlP1JtIDdsk5/P7b52xNgcpE7uTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pVXk5n88; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pVXk5n88"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so306902a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776432678; x=1777037478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRvsl2+xaLX15c8bn64K4rh3d7LVuLbPSeYH3sCYDFo=;
        b=pVXk5n88uymgcCdm+EqEatU9lO+EmUSOmCB41ci5HIn4I/4H7JyoyBz2bk5Q8TsgsE
         xm1c8LQ6kjuRsgMAc2GA9/6h0/6QKXx0wPAnZUXSTmW/Ubd70ToN+4fTN6WsQygAkjMA
         zgyGiXsfNOZMWiOVRLcqqoViEVTwcHd6paZAZohvnMo3gXCN05kaYgk4DYAKoDGFhG3H
         Mpls74iDF+B2Jw56/rsqU1Ty1wR4ZJRF+/ybPPTEpuamuYNfPBenxm01zRswKfCJi1Gb
         x2rJ0xH8qsNF7IDt1NS9jqupJvQ1T+RetFGLLI/puIanpAu3X8MuTV/3UBLAl+rlaQbS
         oE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432678; x=1777037478;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vRvsl2+xaLX15c8bn64K4rh3d7LVuLbPSeYH3sCYDFo=;
        b=p7/cCSeF0auG36T6SgtD31BC3k+w4YpvTQjCpZYCtkyNbViOaj0luqrnPUazYw9ySE
         KFBIA9uHWZCilzu2WMj9YT90Y8xPxa5deukyKe1m/tpp7r3KIrZjS/Y8QaqID0dWYHO7
         AWyRBQfmzPqJYOOpiEPFSCU3z21BFys4zNkKzSSjSzT+fs60vhEWgp0ERpt4b/vnToVH
         jAQ+dpnudnEGa7RvFmjE/06iay8viVAFgGq4rAg+xd0Rjp8hCRsTuvNynlUVmpvBt1oE
         KoTSr8F+cthGpDikvipfJTKoqlUoXsv5oXtSddrAOLzxrpJ0b6WWI5qxQQWd1p+fwEHh
         GtxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ReTkRkeUj2BdSKYxTMe5KpdAPzBN1uznXLWarbQPs9ahEbM+f6vfQVvmq4UPzO4dx1wsIxvV7qwqqfdRV@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/fJDrYvxD47tyY47+/Zxa5GsoYmmm4iY6BdD2Raah5z6VPQI5
	5NRL2FK8be1nG96lR3YYs3J8OkxrYEr7QzEAbo6ylrchvhtXCUfTOVsEVTZrYVLSBnhdwq0YHrJ
	zEhVMiQ==
X-Received: from pgj66.prod.google.com ([2002:a63:945:0:b0:c79:15ba:9c4c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3285:b0:39b:e3aa:df2d
 with SMTP id adf61e73a8af0-3a08c860091mr2686502637.7.1776432677923; Fri, 17
 Apr 2026 06:31:17 -0700 (PDT)
Date: Fri, 17 Apr 2026 06:31:16 -0700
In-Reply-To: <ce3e8a51-63fe-4723-b1d8-6555b8b77817@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260313122040.1413091-5-clopez@suse.de> <202604031640.vckbuS2S-lkp@intel.com>
 <ce3e8a51-63fe-4723-b1d8-6555b8b77817@suse.de>
Message-ID: <aeI2JCLldUFff0Q0@google.com>
Subject: Re: [PATCH 2/4] KVM: VFIO: use mutex guard in kvm_vfio_file_set_spapr_tce()
From: Sean Christopherson <seanjc@google.com>
To: "Carlos =?utf-8?B?TMOzcGV6?=" <clopez@suse.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	alex.williamson@redhat.com, pbonzini@redhat.com, 
	open list <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026, Carlos L=C3=B3pez wrote:
> On 4/7/26 5:48 AM, kernel test robot wrote:
> > Hi Carlos,
> >=20
> > kernel test robot noticed the following build warnings:
> >=20
> > [auto build test WARNING on d2ea4ff1ce50787a98a3900b3fb1636f3620b7cf]
> >=20
> > url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-L-pez/KVM=
-VFIO-clean-up-control-flow-in-kvm_vfio_file_add/20260314-053050
> > base:   d2ea4ff1ce50787a98a3900b3fb1636f3620b7cf
> > patch link:    https://lore.kernel.org/r/20260313122040.1413091-5-clope=
z%40suse.de
> > patch subject: [PATCH 2/4] KVM: VFIO: use mutex guard in kvm_vfio_file_=
set_spapr_tce()
> > config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/2=
0260403/202604031640.vckbuS2S-lkp@intel.com/config)
> > compiler: powerpc64-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260403/202604031640.vckbuS2S-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202604031640.vckbuS2S-l=
kp@intel.com/
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> >    arch/powerpc/kvm/../../../virt/kvm/vfio.c: In function 'kvm_vfio_fil=
e_set_spapr_tce':
> >>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:219:13: warning: unused var=
iable 'ret' [-Wunused-variable]
> >      219 |         int ret;
> >          |             ^~~
> >=20
>=20
> Sean, should I send a v2 for this or will you fix it up when applying?

I'll fixup when applying.
