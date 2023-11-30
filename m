Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288854663
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 17:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dy4Ayyqa"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5d0c4ba7081so21194337b3.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 09:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701366585; x=1701971385; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=poBE260KekrwVAOgg+M3fF5Kt/ICZ7GAjNWMaWtdSzg=;
        b=dy4AyyqaCgBiHfyYKJJfkbdGSUHwKxn6TnBCgcpde0no2hjYBEa/okheaQ2QwLiQYC
         EuHBRGH5LwMQ1o70kJTwz1llStB7BxfPexrGFq2nFlbHdFV7pym1kgZoxlMhIAnxpSjy
         9u+lBiTQjih4C3kSZX1VqXsgetrZK4A+I2qv38T8CvEJuZLeiIV5ENv51D4NIstMnz07
         YRplOHlgHpYISNEWWxqBRcoAaTd5sE8R9f8X7NUqacDYEehyk7K09lxwdqVl8r3AATzk
         h2e7pbZlAEpPilk5jgLhAa/HXSDZPZMvtqHG26zqFq8wMLBl+suAFSpXwH1/HbvajHh8
         In2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701366585; x=1701971385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=poBE260KekrwVAOgg+M3fF5Kt/ICZ7GAjNWMaWtdSzg=;
        b=Hw2gXhKQ63zE5eHdf2ZEW6gFdZ5zIJTcmVnwtbjecAnWKbhsUl8Szig5kjD2IiyHew
         27gs0N0hb5LrIawqd/kY/vWNONdaBB9ALYesfKHGNMNrs1dSkI6a7gGckpBXo2GIwOjh
         FMX54hQt3buovkJQhvrj8AjECJvnpIw3TIxC2joJHGoX6fwyOdrJP4zVB+VLnNcoFIIC
         oSgIllK3Ge+YCum0ZgFLLgMZ3LVl+yY3xPNMqPv9ArnY7cmF9E1KQ+dI0hwgm4elki8r
         RnW4n+7PBEs42rmjrqVWr0d5fSuwRG66gN223v8epBcmODPV+c7Itd4Ucn2EqdSKNU0r
         OrDQ==
X-Gm-Message-State: AOJu0YxGOvYMDZNJvR1VcrqrKQW38Kaif3FVlc+K8FmpW/GC+jBEKh26
	Y2kK0CBdvpbC37JVRApfMeS9gU19iZY=
X-Google-Smtp-Source: AGHT+IFKIQiSFMhY9qIDegdCeGs56VhwQM1SLPMyPsnHTxpb4uIQIzrRqUJpJKjBsiy/h0VKitgvRRcgueU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:3383:0:b0:da0:c6d7:8231 with SMTP id
 z125-20020a253383000000b00da0c6d78231mr749060ybz.0.1701366584635; Thu, 30 Nov
 2023 09:49:44 -0800 (PST)
Date: Thu, 30 Nov 2023 09:49:43 -0800
In-Reply-To: <87v89jmc3q.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202311302231.sinLrAig-lkp@intel.com> <87v89jmc3q.fsf@redhat.com>
Message-ID: <ZWjLN3As3vz5lXcK@google.com>
Subject: Re: arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates
 bits from constant value (1b009b becomes 9b)
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 30, 2023, Vitaly Kuznetsov wrote:
> kernel test robot <lkp@intel.com> writes:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
> > commit: a789aeba419647c44d7e7320de20fea037c211d0 KVM: VMX: Rename "vmx/evmcs.{ch}" to "vmx/hyperv.{ch}"
> > date:   1 year ago
> > config: x86_64-randconfig-123-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302231.sinLrAig-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302231.sinLrAig-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202311302231.sinLrAig-lkp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> >    arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
> 
> This is what ROL16() macro does but the thing is: we actually want to
> truncate bits by doing an explicit (u16) cast. We can probably replace
> this with '& 0xffff':
> 
> #define ROL16(val, n) ((((u16)(val) << (n)) | ((u16)(val) >> (16 - (n)))) & 0xffff)
> 
> but honestly I don't see much point...

Yeah, just ignore 'em, we get the exact same sparse complaints in vmcs12.c and
have had great success ignoring those too :-)
