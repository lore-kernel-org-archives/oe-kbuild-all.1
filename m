Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A513BA39
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 10:30:08 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0D02C120005;
	Wed, 23 Aug 2023 13:22:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0D02C120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692786139;
	bh=u8vSjzRm+TKtu+02u8Ig/YImRtaOqhvRjgc7BYTScm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=fGuPv4vqi08nVpGVG1Cn++/HqA+BwNMO79S5tlDyIgaU2IAEStDamLNJPlnLzLwYq
	 wMuFMmh7kGSxdRuv7eVb53PrkF4BKV1QQTZ6EUlp6jEQsW7scBpipW/PMZwlFb5lxs
	 xZD+CyTSbWC1dOyoLS08KFx30oV88wJRIPSKSldBpZJNKMFZVpxOr6/JVgLkseKxk8
	 A0UwfyzggVfk54SE+AaL3UmYdiiinqydMmn5QKgxgU19ahbuBEPhfrQwPc36mamG3l
	 RzUx1wH0QZEnyCWN2kxp80xpVQ6QcRSiEcfxRRHFJZ/ExIKoNh8Oph4NT+lwhJf2RU
	 B5gD6jTaaYWuA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 23 Aug 2023 13:22:18 +0300 (MSK)
Received: from [192.168.0.106] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 23 Aug 2023 13:22:12 +0300
Message-ID: <993e3952-b082-8116-2937-1f5ed3d017c0@sberdevices.ru>
Date: Wed, 23 Aug 2023 13:16:14 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [linux-next:master 1241/11761] ERROR: modpost: ".L874"
 [drivers/mtd/nand/raw/nand.ko] undefined!
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <202308231008.lxCTs3d2-lkp@intel.com>
 <b55586bc-2729-72a6-a3f6-c5f2e7e376ca@sberdevices.ru>
 <20230823120747.772c807d@xps-13>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230823120747.772c807d@xps-13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179397 [Aug 23 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;git.kernel.org:7.1.1;salutedevices.com:7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;download.01.org:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/08/23 05:56:00
X-KSMG-LinksScanning: Clean, bases: 2023/08/23 05:55:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/23 04:58:00 #21681850
X-KSMG-AntiVirus-Status: Clean, skipped



On 23.08.2023 13:07, Miquel Raynal wrote:
> Hi Arseniy,
> 
> avkrasnov@sberdevices.ru wrote on Wed, 23 Aug 2023 10:39:44 +0300:
> 
>> Hi Miquel,
>>
>> I guess this is not related to my last commit to NAND, e.g.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/mtd/nand/raw/nand_base.c?id=079c8d9da26ed041a54706de68b754337e6df17e
> 
> I don't understand why, but maybe. I cannot reproduce, the compiler
> does not get downloaded on my side. I tried with an x86 build with a
> 11.0 gcc, no errors. Can you try the reproducer on your side?

I get the same problem with compiler downloading

> 
> Looking at the code, I don't see what's wrong, besides maybe the fact
> that we forgot to remove the prototype from nand/raw/internals.h. (if
> you want to make a followup patch).

Yes, I'll send it, as prototype is now in another file. I guess there is no
need to set Fixes tag for this patch, because it is very unclear will it
fix this error or not. Prototype from nand/raw/internals.h must be removed
anyway.

Thanks, Arseniy

> 
> Thanks,
> Miquèl
> 
>>
>> ?
>>
>> Thanks, Arseniy
>>
>> On 23.08.2023 05:56, kernel test robot wrote:
>>> Hi Arseniy,
>>>
>>> First bad commit (maybe != root cause):
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   28c736b0e92e11bfe2b9997688213dc43cb22182
>>> commit: 079c8d9da26ed041a54706de68b754337e6df17e [1241/11761] mtd: rawnand: export 'nand_exit_status_op()'
>>> config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20230823/202308231008.lxCTs3d2-lkp@intel.com/config)
>>> compiler: hppa-linux-gcc (GCC) 13.2.0
>>> reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231008.lxCTs3d2-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202308231008.lxCTs3d2-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_rr.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_wrr.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lc.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_wlc.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_fo.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_ovf.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblc.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblcr.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_dh.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sh.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sed.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_nq.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_twos.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_ftp.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_pe_sip.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_defrag_ipv4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_reject_ipv4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_nat.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_raw.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/xfrm4_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_raw.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_nat.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_defrag_ipv6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_reject_ipv6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/xfrm6_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/mip6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ip6_udp_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ar9331.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_brcm.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_dsa.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_gswip.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_hellcreek.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ksz.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_lan9303.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_mtk.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_none.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot_8021q.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_qca.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl4_a.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl8_4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rzn1_a5psw.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_sja1105.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_trailer.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_xrs700x.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xdp/xsk_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_crypto_test.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_token_test.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/nf_conntrack_bridge.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtables.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_broute.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_filter.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_nat.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/sunrpc.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/auth_rpcgss.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/rpcsec_gss_krb5.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/kcm/kcm.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/smc/smc_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_socket.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_usb.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/6lowpan/ieee802154_6lowpan.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/ieee802154_socket.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci_spi.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nfc_digital.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/vmw_vsock/vsock_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/hsr/hsr.o  
>>>>> ERROR: modpost: ".L874" [drivers/mtd/nand/raw/nand.ko] undefined!  
>>>   
> 
> 
