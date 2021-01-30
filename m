Content-Type: multipart/mixed; boundary="===============9178568613481708970=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: bnx2x_main.c:undefined reference to `synchronize_net'
Date: Sat, 30 Jan 2021 11:11:01 -0800
Message-ID: <d087f29f-e9d1-382d-0a5e-50d9a5280a82@infradead.org>
In-Reply-To: <20210130103104.28a4ed6b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9178568613481708970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/30/21 10:31 AM, Jakub Kicinski wrote:
> I don't understand how this one happens and don't have a PPC build
> setup :S So many things seem to depend on NET here that "this should
> never happen". Must be some rogue "select" pulling BNX2 without its
> dependencies?

Yes, the problem is overuse of Kconfig "select" in powerpc for the
AKEBONO platform. The Kconfig warnings are listed at the end:

>>
>> Kconfig warnings: (for reference only)
>>    WARNING: unmet direct dependencies detected for NETDEVICES
>>    Depends on NET
>>    Selected by
>>    - AKEBONO && PPC_47x
>>    WARNING: unmet direct dependencies detected for ETHERNET
>>    Depends on NETDEVICES && NET
>>    Selected by
>>    - AKEBONO && PPC_47x
>>    WARNING: unmet direct dependencies detected for HOTPLUG_CPU
>>    Depends on SMP && (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_=
BOOKE
>>    Selected by
>>    - PM_SLEEP_SMP && SMP && (ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_P=
OSSIBLE && PM_SLEEP
>>    WARNING: unmet direct dependencies detected for NET_DEVLINK
>>    Depends on NET
>>    Selected by
>>    - QED && NETDEVICES && ETHERNET && NET_VENDOR_QLOGIC && PCI
>>    WARNING: unmet direct dependencies detected for GRO_CELLS
>>    Depends on NET
>>    Selected by
>>    - MACSEC && NETDEVICES && NET_CORE
>>    WARNING: unmet direct dependencies detected for FAILOVER
>>    Depends on NET
>>    Selected by
>>    - NET_FAILOVER && NETDEVICES

I'm pretty sure that Michael Ellerman (powerpc maintainer) was going to make
some defconfig file changes for AKEBONO, but I'm not so sure that that
change will prevent randconfig build errors. I'm in a wait-and-see mode on =
that.

Hm, looking back at his reply to my (powerpc, not net:) patch,
I owe him a reply, so I'll look into that.

https://lore.kernel.org/linuxppc-dev/875z3prcwg.fsf(a)mpe.ellerman.id.au/

-- =

~Randy

--===============9178568613481708970==--

