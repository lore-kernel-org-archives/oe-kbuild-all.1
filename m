Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB62215C8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 03:34:59 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-51ba4b1b9feso118180497b3.11
        for <oe-kbuild-all@lists.linux.dev>; Sat, 04 Feb 2023 19:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fcwD730JuegJS9ZrkIlmvCTSQQeySoHb1pg0TjvLj4k=;
        b=K5ih6AUOASfJQCxBzijpSTnTup+RVfJjyiSgYPmG0SCljR71HsUqWISpsex0ufKKO+
         B3yoNExk3zcU8LjbNYso/tu4uOmdrVFsc1UlCg7qOAVPFAxtBbR2pGGDluRLpHui0MMp
         XsaUOfyDJ3QYaQ1Iv56+obvzlO1e5s4H3f133F3bgwLW08NA+sJiEhGQn1F+IcM4mjZa
         YbkerwBqYs2LmuAI14bkWNGIFdHttaKJngL8XIf0OfuLWnK429kwWwQ5mOLHMZ7IlmCV
         va2BDkDfRep7MhCZGJ/7GQM4QD1Ncj6OTeXE1Dzqs66lEI+zF4WjsY7GwuROZQBkP33T
         bHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcwD730JuegJS9ZrkIlmvCTSQQeySoHb1pg0TjvLj4k=;
        b=k4cQmPiWJeXOnI+oFfwykuOivo1qDgf2a90BEHAHeQU1glnfaaUVY2a/2OmnBqojbe
         qf3QqZiAWn/pc+cjDcpfEYDLXMV23MyQfewOkYBanvWbUDDie/n+m3IYzP6mATfArsDt
         NFCtIpGTDaTQX0UOcQLsrrIyg4NVghVXl19LrYj2oSYoAV+U/gNEx5n/QzWGFa2HWNfR
         MeiaTKV5dWAwNluCidm9v1LvhEDmpBXuyIvF1525WF28mnap8NRk22ooWasdd5FUlzP7
         AfPl5Rg1rlIpd4FV+Bw10ESXfRrf5PDb9lupcaFeHiRkKVjv+1EtvxuG406ga3Dsqp0z
         p7qw==
X-Gm-Message-State: AO0yUKUWMesTDtQ/kgtNqy+c72NjYU6zx6gzhvPlRGps3XKCMy4GshBj
	ksgW103XAKC3mh6Gvbj0ZKXRUCoBndp7Rm9+AKA=
X-Google-Smtp-Source: AK7set/WMVjziLschXh8TLMwDh9aQwxEyvuoYBxqceAIqUq1zHx5v9hq4fKwGe2bi4B+cgYFROlNzsvAvh028s1pXeI=
X-Received: by 2002:a0d:d94e:0:b0:526:bfed:89ca with SMTP id
 b75-20020a0dd94e000000b00526bfed89camr595368ywe.171.1675568098565; Sat, 04
 Feb 2023 19:34:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6eca3cf10a8c06f733fac943bcb997c06ec5daa3.1675548023.git.lucien.xin@gmail.com>
 <202302050823.JwxMWCH9-lkp@intel.com>
In-Reply-To: <202302050823.JwxMWCH9-lkp@intel.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Sat, 4 Feb 2023 22:34:37 -0500
Message-ID: <CADvbK_fVBubU7cdrSa_PGGATU8WxAmjSA_F=MR2GmAATjqUqYA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/5] net: create nf_conntrack_ovs for ovs and tc use
To: kernel test robot <lkp@intel.com>
Cc: network dev <netdev@vger.kernel.org>, dev@openvswitch.org, 
	oe-kbuild-all@lists.linux.dev, davem@davemloft.net, kuba@kernel.org, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pravin B Shelar <pshelar@ovn.org>, Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jiri Pirko <jiri@resnulli.us>, Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Ilya Maximets <i.maximets@ovn.org>, 
	Aaron Conole <aconole@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 4, 2023 at 8:11 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Xin,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on net-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Long/net-create-nf_conntrack_ovs-for-ovs-and-tc-use/20230205-060514
> patch link:    https://lore.kernel.org/r/6eca3cf10a8c06f733fac943bcb997c06ec5daa3.1675548023.git.lucien.xin%40gmail.com
> patch subject: [PATCH net-next 1/5] net: create nf_conntrack_ovs for ovs and tc use
> config: s390-defconfig (https://download.01.org/0day-ci/archive/20230205/202302050823.JwxMWCH9-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/e2bb7f965a86f833a4ae6ec28444ba328fdfc358
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Xin-Long/net-create-nf_conntrack_ovs-for-ovs-and-tc-use/20230205-060514
>         git checkout e2bb7f965a86f833a4ae6ec28444ba328fdfc358
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "nf_ct_helper" [net/openvswitch/openvswitch.ko] undefined!
> >> ERROR: modpost: "nf_ct_add_helper" [net/openvswitch/openvswitch.ko] undefined!
>
caused by:

+       select NF_CONNTRACK_OVS if NF_NF_CONNTRACK

"NF_NF_CONNTRACK", incorrect option name was used, will fix it.
The same cause is for Patch 2/5 and 5/5.

Thanks.
