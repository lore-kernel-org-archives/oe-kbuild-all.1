Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237118C15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 15:59:53 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2BB354131F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1682006383;
	bh=qKrWaXjPs2YROPlNKMU9trbAL8v3RYBRxAuFsIw3YYk=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID;
	b=LUJliVvCi8e1SPH+01y9IXkL3OQWD/rM5laUkfDqXdD+xW33s5DFk+Y2oNOmFdItf
	 eLFJO/e8J8dLebUtrTZND3Ijk3a7iKkDhgKgzghyWC/YWKBEaU8HmovZsaRbqUTQuV
	 YCpzoDAkG5vc31T8uM2c4ZOjV8h3eTko/r3VuW9V7vgEQQETKLCJiMPnUp40D9uTt4
	 mrWVZuF68H3WmQ8U4Ct7VHNtkxS0qa3zwgt2oON6tZBRYebltqcRHVAPd/ANo3TYVK
	 GhfrSeuIQK7KR7UWDZ/uaypBCynaQwZpKs0TSCB5JCF6/txb0zmIlsMAIYogXEGcBw
	 X3gTQ6YzzE9Kg==
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-51442ffc984so671254a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 08:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682006382; x=1684598382;
        h=message-id:date:content-transfer-encoding:content-id:mime-version
         :comments:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKrWaXjPs2YROPlNKMU9trbAL8v3RYBRxAuFsIw3YYk=;
        b=APAaSlB4eSVTN9hi8rWPH/x6+SvOU3A3nS4TwastcRyPm6xgPI73QGQ6oA1n6oDTCS
         FAz/ny1ZhwfBXmxt9JJCmaRBVVFmTdWJtmOlr4FtmoExXThvv27OJM3z/yZqUhWBZ6mu
         ToVn84DJowhtPV5EvFlbrTGlZV5AWEHYiJXNuoY+1w5T6qk0TkI0Sx7SBFth2WA5m/br
         3l7b+/NE7KKVOlD8R9bjaav6T3FU+QGFx1XqM0XwW0qAj/gQm+xtp/zuTfmTFQWhXsB4
         u2y4OIJjjLizgeTuBAvwj3jRB++xHEDVopYWLj0jeay752U16niEv2PX0p5VVXPJiRAk
         fWaQ==
X-Gm-Message-State: AAQBX9fG8Nf55J5t/mdEBPjl8HJlB22avcaNrnyEczhW0j+d9420p1aq
	8H+Xv+lGEhLujZ4plEid5gdvh6H0neag474mbDs0nMSqlWZjsxhdVvCaqsziVNFOhhMr4VbHuvZ
	+/tM9piW3IzYrWF+phPfQmXe1bk9621AE71eKvVeUwZVzKk81RbA=
X-Received: by 2002:a17:90b:3841:b0:247:e4c:d168 with SMTP id nl1-20020a17090b384100b002470e4cd168mr2255994pjb.10.1682006381777;
        Thu, 20 Apr 2023 08:59:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZnL2meKocCyCm7GqMe6oUN3YJyWLBDEset6G0CF5T9FnjTpcMO2t2fW1MB8bD4KLlDLeyKHQ==
X-Received: by 2002:a17:90b:3841:b0:247:e4c:d168 with SMTP id nl1-20020a17090b384100b002470e4cd168mr2255977pjb.10.1682006381429;
        Thu, 20 Apr 2023 08:59:41 -0700 (PDT)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902690c00b001a64a2b790fsm1323514plk.164.2023.04.20.08.59.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:59:41 -0700 (PDT)
Received: by famine.localdomain (Postfix, from userid 1000)
	id 9C9EB607E6; Thu, 20 Apr 2023 08:59:40 -0700 (PDT)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id 95F979FB79;
	Thu, 20 Apr 2023 08:59:40 -0700 (PDT)
From: Jay Vosburgh <jay.vosburgh@canonical.com>
To: kernel test robot <lkp@intel.com>
cc: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org,
    oe-kbuild-all@lists.linux.dev,
    "David S . Miller" <davem@davemloft.net>,
    Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
    Eric Dumazet <edumazet@google.com>, Liang Li <liali@redhat.com>,
    Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH net 1/4] bonding: fix send_peer_notif overflow
In-reply-to: <202304202222.eUq4Xfv8-lkp@intel.com>
References: <20230420082230.2968883-2-liuhangbin@gmail.com> <202304202222.eUq4Xfv8-lkp@intel.com>
Comments: In-reply-to kernel test robot <lkp@intel.com>
   message dated "Thu, 20 Apr 2023 22:34:12 +0800."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27708.1682006380.1@famine>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Apr 2023 08:59:40 -0700
Message-ID: <27709.1682006380@famine>

kernel test robot <lkp@intel.com> wrote:

>Hi Hangbin,
>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on net/main]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Hangbin-Liu/bondin=
g-fix-send_peer_notif-overflow/20230420-162411
>patch link:    https://lore.kernel.org/r/20230420082230.2968883-2-liuhang=
bin%40gmail.com
>patch subject: [PATCH net 1/4] bonding: fix send_peer_notif overflow
>config: parisc-defconfig (https://download.01.org/0day-ci/archive/2023042=
0/202304202222.eUq4Xfv8-lkp@intel.com/config)
>compiler: hppa-linux-gcc (GCC) 12.1.0
>reproduce (this is a W=3D1 build):
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # https://github.com/intel-lab-lkp/linux/commit/5bf7296696ea0aa39=
97bf310fae2aa5cf62a3af5
>        git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>        git fetch --no-tags linux-review Hangbin-Liu/bonding-fix-send_pee=
r_notif-overflow/20230420-162411
>        git checkout 5bf7296696ea0aa3997bf310fae2aa5cf62a3af5
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dparisc olddefconfig
>        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dparisc SHELL=3D/bin/bash
>
>If you fix the issue, kindly add following tag where applicable
>| Reported-by: kernel test robot <lkp@intel.com>
>| Link: https://lore.kernel.org/oe-kbuild-all/202304202222.eUq4Xfv8-lkp@i=
ntel.com/
>
>All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "__umoddi3" [drivers/net/bonding/bonding.ko] undefined=
!

	I assume this is related to send_peer_notif now being u64 in the
modulus at:

static bool bond_should_notify_peers(struct bonding *bond)
{
[...]
        if (!slave || !bond->send_peer_notif ||
            bond->send_peer_notif %
            max(1, bond->params.peer_notif_delay) !=3D 0 ||

	but I'm unsure if this is a real coding error, or some issue
with the parisc arch specifically?

	-J

---
	-Jay Vosburgh, jay.vosburgh@canonical.com

