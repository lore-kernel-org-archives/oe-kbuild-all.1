Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AC415EFD4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jul 2024 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719842260; cv=none; b=t6WObLXDSvEDQp/OPFMRQtzZxv6E0w3rIZWHZ/7BMAAGpTd5E2ZyDRDngzSckXoLi9wLWBY7Ea9oMvFkaDcw6q40+BGe0dLXSDwi7+z87MRQaVC3kyJeLDQO/z6R63Emw0D03IR5hKQc1BOQmn7HrKEjOlppMKv5RJiKECD8a6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719842260; c=relaxed/simple;
	bh=q4Tlp8L3YA7sU5nI4qhzoiE7VzHkRKz3L17RSUaYfk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBIRFo0nmCmFe3qCaXWRFcY5Da+WyldFDSB5hIykr+W5Eq19fLV2S2LkArgFVF+ZGLvdmEI0rZQBlZoxW5loCTCPe0jLvjDdp9HdzAIkiyGO6ODONQJT3QnGo1pONA9g9h1sNoYN4JeCGLbcTmBWQRkgAOsDo0dBw6qRCjhcHKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BFg8ryxK; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BFg8ryxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zD3cTEqHr7BBmyEyrcvBaESEmu6RvolSv7CFPJanwbk=;
	b=BFg8ryxKaEua3aLXmQofOrzV/sOLRZr/1zfuecno4VNw8+unJ3dZeTxFcfiBuk
	eNewwrvsUj6VuM4zeG2VH4pe+L2kMRE6SpvyfJiVO1RjfHUBWQcHP8e6M+EdU1a7
	LZ8b97txVyvUDRfSX0jeZ/qjcJhMV8fL3p/i0UDbqOyXk=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3PweutYJm30QCAA--.5851S3;
	Mon, 01 Jul 2024 21:57:03 +0800 (CST)
Date: Mon, 1 Jul 2024 21:57:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: kernel test robot <lkp@intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shawn Guo <shawnguo@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [linux-next:master 8598/9689]
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts:64.22-68.5: Warning
 (unit_address_vs_reg): /reserved-memory/memory: node has a reg or ranges
 property, but no unit name
Message-ID: <ZoK1rog19FIrdQUh@dragon>
References: <202406290945.3KbIuqTZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406290945.3KbIuqTZ-lkp@intel.com>
X-CM-TRANSID:M88vCgD3PweutYJm30QCAA--.5851S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw1xJw4rCw48XFWkCrW3ZFb_yoW8XF43pF
	yrur4qqF4Igr1xZ3yDXr4kZFWDtws5GF15WayDCryUKr47Zry2v3WSk3y3Wryq9r1xKayf
	AF12qr12qw1DXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrUUUUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhEPZWZv-dsYEgAAsM

On Sat, Jun 29, 2024 at 10:14:59AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   1eb586a9782cde8e5091b9de74603e0a8386b09e
> commit: 218ae84503fff008005ef4525f5b13fe0080ab4b [8598/9689] arm64: dts: imx8qm-mek: add cm4 remote-proc and related memory region
> config: arm64-randconfig-r013-20211027
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build):
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406290945.3KbIuqTZ-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/freescale/imx8qm-mek.dts:64.22-68.5: Warning (unit_address_vs_reg): /reserved-memory/memory: node has a reg or ranges property, but no unit name

Fixed it up with the change below.

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 4a6f47f0998c..08c35a1ee73e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -61,7 +61,7 @@ rsc_table0: memory@900ff000 {
                        no-map;
                };
 
-               vdevbuffer: memory {
+               vdevbuffer: memory@90400000 {
                        compatible = "shared-dma-pool";
                        reg = <0 0x90400000 0 0x100000>;
                        no-map;

