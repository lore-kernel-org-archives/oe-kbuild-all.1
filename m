Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549379;
	b=gbX/tzaAbQIglYHZ8fvHJ9kqoesaSaHcuquH4JzgaGtl7Ivb4ZdWu2pSVH+ufgKJzT9x
	 bi20pEOutnbFScg1NjZhuFP/VUE28wMtsQ5ywO8lKh/+u8CF1VByp16A6SAYHRjy7dwmF
	 zICy8F+grakocrHywZ6OE/2uMZ8LZ8uyMFvflMLdMHGy3XZFJPdzggp9U9W+1j8tLozYb
	 yak+mEYhXg2wUZfjMyFKQcM6zfR8d/+3Uf4L4Lk3dJ++J4ZI6NPIO5/wovm46YRWlPR5Q
	 GR3mf6QJngG94ldifTUDvuwMwKvyGvTUfOO83wPM7seRQM4GAJvOLvM1VFPb5gP4i4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549379;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uwMtaKSskAkPXs11hNqXkRCVbxtcVXsJSg4zM3DM8BU=;
	b=OrdZW+lFXNqOMAaX5N35XCpsKRG04fbZlw5AQrDUBMoUP/L+m6U3yHFQJFiLZo2hSZA3
	 Xps2ssGScuovylJ1Q1MRGC3qtkGV4MUWJoBThYE6OjlMCXh4V/U6M61UsDXnBJl/QAPgC
	 L/CPfWuLtC4T3T0aCKeBU8H+6NHUnyBGHW1BV8h5b7/0POY0YWow7R8px6k8nAb+MNRRd
	 i+k9UGr7Hn3KpzMPW1+C8I6bv/C+0KUMaG0G5IdsP2YnIkHR4H84Mvjn1YKGZyVFaXVOy
	 7ERThDIsh8utlE9CgmJJtNdfulHavegZI4tqLZJ8ESMggW2LyaBelITTBczn1EobyUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HC1Uprm+;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD47606A319;
	Wed, 21 Oct 2026 02:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD47606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HC1Uprm+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uwMtaKSskAkPXs11hNqXkRCVbxtcVXsJSg4zM3DM8BU=; b=HC1Uprm+PoPOwFvHsyRpy+oyby
	hv+PHSuTwcdNlyrjvSfVrQ0Ts98MyX1RyaKtSQJIA+4+a61ZyZ4vy62FrQmM2ZhkzMURdS9gIzXw6
	V6wmztEa1e724RIL9Q3nf8Ds07HObj0uQ70aDeLl9xLyB81LyBGbo51KPMuhDocSMXd3XnWMKCIrd
	bNQ77/i3SiRuOLSGLV7AFO7O0f85nHAYmR0JgDSMaEC5+XMQ5E3CiNFXxxUjYxSg0mhkN7hVasN3T
	t51hieTjzJqljn8S4eujJpjX1dOua/R5Z7VOGLabKgEf22DGz7wSE6q56aWzPXpmHfsfWZ2xI/rr5
	hpTTgyVQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLyc-0000000AwPx-3OSM;
	Wed, 21 Oct 2026 02:22:50 +0000
Message-ID: <16d0bddf-cca3-4ef7-ad68-4017ae275e80@infradead.org>
Date: Tue, 20 Oct 2026 19:22:49 -0700
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3622/16987] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Waqar Hameed <waqar.hameed@axis.com>,
 oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <202610151025.1g5IgCv2-lkp@intel.com>
 <a9c10b54-be65-4448-8d1d-fde894336484@infradead.org>
 <20261020101625.01874245@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261020101625.01874245@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/20/26 1:16 AM, Mauro Carvalho Chehab wrote:
> On Mon, 19 Oct 2026 17:15:02 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> [for kernel-doc people]
>>
>> On 10/15/26 1:11 AM, kernel test robot wrote:
>>> Hi Waqar,
>>>
>>> FYI, the error/warning still remains.
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   d419d682257d813f6cb7a28e42b35d0edf4ad038
>>> commit: 3f21de6784a654503cc148169d1f59d89971da13 [3622/16987] power: supply: rt9467: Use POWER_SUPPLY_PROP_LOAD_SWITCH
>>> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
>>> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)  
>>
>> I am using:
>> $ docutils --version
>> docutils-3.13 (Docutils 0.23, Python 3.13.16, on linux)
>> $ python3 --version
>> Python 3.13.16
>>
>>
>>> reproduce: (https://download.01.org/0day-ci/archive/20261015/202610151025.1g5IgCv2-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202610151025.1g5IgCv2-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>    Using alabaster theme  
>>
>>
>>>>> Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline emphasis start-string without end-string. [docutils]  
>>>    Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]  
>>
>> and I only see one of these warnings (rt9467), although the sources
>> for them are VERY similar.Why would that happen?
>> Do we need to fix anything?
>>
>>> vim +1 Documentation/ABI/testing/sysfs-class-power-rt9467
>>>
>>> eedb923279b78cb ChiaEn Wu 2023-01-03 @1  What:		/sys/class/power_supply/rt9467-*/sysoff_enable
> 
> Getting just line 1 is wrong. See:
> 
> 	$ ./tools/docs/get_abi.py -D Documentation/ABI/testing/ rest --enable-lineno|grep -A20 rt9467
> 
> 
> 	.. LINENO Documentation/ABI/testing/sysfs-class-power-rt9467#1
> 
> 
> 	.. _abi_sys_class_power_supply_rt9467_sysoff_enable:
> 
> 	+-----------------------------------------------------------+
> 	| **\/sys\/class\/power_supply\/rt9467\-\*\/sysoff_enable** |
> 	+-----------------------------------------------------------+
> 
> 	Defined on file :ref:`sysfs-class-power-rt9467 <abi_file_testing_sysfs_class_power_rt9467>`
> 
> 	This entry allows enabling the sysoff mode of rt9467 charger
> 	devices.
> 	If enabled and the input is removed, the internal battery FET
> 	is turned off to reduce the leakage from the BAT pin. See
> 	device datasheet for details. It's commonly used when the
> 	product enter shipping stage. After entering shipping mode,
> 	only 'VBUS' or 'Power key" pressed can make it leave this mode.
> 	'Disable' also can help to leave it, but it's more like to
> 	abort the action before the device really enter shipping mode.
> 
> 	Access: Read, Write
> 	Valid values:
> 	- 1: enabled
> 	- 0: disabled
> 
> 
> 	.. LINENO Documentation/ABI/testing/sysfs-class-power-rt9471#19
> 
> Just like kernel-doc, lines are incremented per symbol.
> 
> Line 1 means the sysfs data that starts on line 1. In this specific case,
> I'm seeing two issues there:
> 
> - 'Power key" - I guess it won't generate a warning, but the quote
>   types don't match.

Your eyes must be better than mine. :)

> - Here, blank lines are missing:
> 
> 	Access: Read, Write
> 	Valid values:
> 	- 1: enabled
> 	- 0: disabled
> 

Yes, I've seen plenty of that issue.

>   Causing this output:
> 
> 	Access: Read, Write Valid values: - 1: enabled - 0: disabled
> 
>   The right way to format it would be:
> 
> 	Access: Read, Write
> 
> 	Valid values:
> 
> 	- 1: enabled
> 	- 0: disabled
> 
>   As RST format considers a single "\n" as if the next line to be
>   part of the same paragraph. So, to split paragraphs, a blank
>   line is needed.
> 
> 
> If you want to test it, I suggest placing the rst content on a file
> and ask Sphinx to build it. What I usually do to test stuff created
> via kernel-doc/get_abi/... is to create a:
> 
> 	Documentation/<temp_dir>
> 
> adding there just an index file and the output I want to test.
> Then, I use make with SPHINXDIRS=<temp_dir>, as this is a lot
> faster than building the entire Kernel.
> 
> 	$ mkdir Documentation/get_abi_tmp_dir
> 	$ ./tools/docs/get_abi.py -D Documentation/ABI/testing/ rest > Documentation/get_abi_tmp_dir/testing_abi.rst
> 	[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
> 	[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
> 	[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
> 	[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
> 	[INFO] Didn't find ABI reference for 'Documentation/ABI/stable/sysfs-devices-node'
> 	[INFO] Didn't find ABI reference for 'Documentation/ABI/stable/sysfs-devices-node'
> 
> 	$ cat <<EOF > get_abi_tmp_dir/index.rst
> 	Test
> 	====
> 
> 	.. toctree::
> 	   :maxdepth: 1
> 
> 	   testing_abi
> 	EOF
> 
> 	$ make SPHINXDIRS=get_abi_tmp_dir htmldocs
> 
> here, I'm placing the entire content of the abi testing, but you
> could alternatively create a dir with a subset of files under ABI
> and test only the ones that hits errors. Once fixed, you can copy
> them back to the ABI directory.

I see.

> Btw, at least here (docs/docs-mw branch), I can´t see any such
> errors.

I don't know why that would be. The files haven't been corrected
for the issues that you identified.

>>>
>>> :::::: The code at line 1 was first introduced by commit
>>> :::::: eedb923279b78cbfe16dd54dade0d73e9977f118 Documentation: power: rt9467: Document exported sysfs entries
>>>
>>> :::::: TO: ChiaEn Wu <chiaen_wu@richtek.com>
>>> :::::: CC: Sebastian Reichel <sre@kernel.org>  

Thanks for your informative help.

Waqar, do you want to update these 2 files for the 2 issues that Mauro
pointed out?  or I can do it...


-- 
~Randy

