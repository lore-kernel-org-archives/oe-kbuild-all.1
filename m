Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886D274B53
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 05:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790571657; cv=none; b=hR8q45FN7IggKnHspDS3Plkwp1AcunncXjsIOJGmd8csJ1iB3ROpndCTA5P/Yok8Csese1Jz+j5gZhc5gbuQQwwrlr4Nmy1Q9HpjT6eDL4bsFanmi6ETIG5DxYo+q1S59Y7q9BLzcnZ0EBJYrlvcFObQDcPuuVTEksXpuYq4hms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790571657; c=relaxed/simple;
	bh=3d0WMlxwOhLe2mw81otxBseHZd1+EeWXaTQEKEvucJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fcg89OwBK74kDMi3AsyK1C5p8KsAnEyQDayxpLhZ6dZAwlZc+mDYxABThAA5ABDA9sq26NVH6WBMkZpyDnMzF85muizbYUBI2njXGSBFbR89GIBMJYbLAjZ+X5DoffjRHOzx4u1OphxR6pdONuv9RjCJDZlveFMto0+T/lJVNf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7KQIhH3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7KQIhH3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3D41F000FF;
	Mon, 28 Sep 2026 05:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790571656;
	bh=34XroDGNrPxmvQLjy3ckjop0aNYdJ+o2MSkbk32Cyz0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O7KQIhH3yEa3Dt2wBa25f+MUSGvoho0oHui/dVNsTUZYzaEj4zj7CDA7HHr8yY/X+
	 IUtghjMrcqbggYncuuWU7UlP+qKRG7HLLFf/QRWIr5zuIQVvs68srDIlKHPpOgLV1U
	 QV0BjW5bzNbtEONWTzM1+H1IzP2VczeKPcefXfWzqpkttaoeYv+MF/LsAPoscbz3Ag
	 NQEZm9wTDDYvgqI2EaOaiM9Xse0BpJE8Dk6EVKHU3CHIvuKnYIBwPqEoCxEEQWadHl
	 bcIOGTXD4ufLuTqrRecfUoNCsv2HC2uA8+6N/ZsVuE6GUrGQtPnwm4uqmnqA/cPFZO
	 DxIIbqmxRzBRw==
Message-ID: <27062652-12e5-428f-b900-e50cff70452e@kernel.org>
Date: Mon, 28 Sep 2026 07:00:50 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1377/10910]
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb:
 vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not
 allowed ('no-map', 'reg' were unexpected)
To: Marek Vasut <marex@nabladev.com>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <202609252351.5UfBIiOJ-lkp@intel.com>
 <b70365a8-9812-434a-b514-4604835cf347@nabladev.com>
 <735d64cb-b35b-4854-8b6e-d1f32822c244@kernel.org>
 <8ed2f318-5758-4d2d-9e31-bebbb067b913@nabladev.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <8ed2f318-5758-4d2d-9e31-bebbb067b913@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/09/2026 20:06, Marek Vasut wrote:
> On 9/27/26 6:59 PM, Krzysztof Kozlowski wrote:
>> On 26/09/2026 01:00, Marek Vasut wrote:
>>> On 9/25/26 11:46 PM, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
>>>> commit: 9a14f327dfcbbb0fa24974cb3a928ea3d7409768 [1377/10910] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>> config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/config)
>>>> compiler: aarch64-linux-gcc (GCC) 8.5.0
>>>> dtschema: 2026.10.dev2+g840a01d41
>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202609252351.5UfBIiOJ-lkp@intel.com/
>>>>
>>>> dtcheck warnings: (new ones prefixed by >>)
>>>>      	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb: vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>>>>      	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>> --
>>>>      	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtb: vdev0buffer@55400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>>>>      	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>> +CC krzk, I just cannot reproduce this locally. Do you know what I might
>>> be missing here ? Thank you !
>>
>> The things or versions listed in top of that email.
> Linux has plenty of examples of such shared-dma-pool/no-map entries:
> 
> arch/arm64/boot/dts/freescale/imx952-evk.dts-		vdev0buffer: 
> vdev0buffer@88020000 {
> arch/arm64/boot/dts/freescale/imx952-evk.dts:			compatible = 
> "shared-dma-pool";
> arch/arm64/boot/dts/freescale/imx952-evk.dts-			reg = <0 0x88020000 0 
> 0x100000>;
> arch/arm64/boot/dts/freescale/imx952-evk.dts-			no-map;
> arch/arm64/boot/dts/freescale/imx952-evk.dts-		};
> 
> Are those broken and need to be fixed, or is it dt-schema that is broken ?

This could be caused by recent dtschema change, which was also recently
fixed. The LKP report had dtschema git version and as you can check it
points exactly to the version changing reserved nodes (which introduced
issues). Not to the latest one which fixes the issue.

If issue is reproduced with 840a01d but not with later, then obviously
everything is fine.

Best regards,
Krzysztof
