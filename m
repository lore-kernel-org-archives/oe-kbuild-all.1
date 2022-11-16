Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9487F12290
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 20:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1668631990; bh=ZvLzuZYQhb0dBMI/6Koc3Kv9Y7MzeAtBBXuasqXWyl4=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SvNHkBxHsLhMOONKF9x2+UcxJ6qxlRNXdpeVxwBCis8v0LR1ExKwnClBajQAtDXOa
	 p+N+uybe+Mstj6Maxp0UPhuG41UBrn431WK+jE2Di2rV1qBZbQgzosDpYdlYsaCQad
	 KTGpQFsLv3gBCjA+tCl25KpIqPlRFAtA/4noLBFs3BXsWgC67rQfYPuwqLwK6KXDYn
	 KmhU8p/6jq1szmVspLDvf/AeAGcmres8a/EI2sf+4T8ktd2rLAXBMVKgR2yAZqPxB4
	 c2JdOe1MS6eRAzHDntgRszjxxxRrdYYmv/JUpIjjFWUtsPt026vwiOMDL75+wACuc6
	 sWLw3I12ARYhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.139.0]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryT9-1pGDPn20aD-00nvIz; Wed, 16
 Nov 2022 21:53:10 +0100
Message-ID: <8905cecd-e5e0-f7aa-59bf-7083c4859820@gmx.de>
Date: Wed, 16 Nov 2022 21:53:09 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: arch/parisc/kernel/setup.c:64 setup_cmdline() warn: inconsistent
 indenting
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202211170149.PzIstxxm-lkp@intel.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <202211170149.PzIstxxm-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ybDnp9L3YlIQVEqvwtlBXTSca7qVuSE29P17yiKInaD9Q/EISEW
 NKS+oQldzcehchZ+3WnDAa2YydbDCcOmF4N8lI/qgR8LA4PjolJq9qOycdzkBUsqKpcJOl1
 nLQOFyD5V/soPmnUlstuTEgMFwRJ701A8orBIYYcHJy+FytyRqAZo5G0jy38CsLTnX3SpAa
 AyMvMoTJ1/DismKiVRitA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8TAQAU2mX+A=;QOSEAzpijcPLmevRl3c2S6Qr3Dq
 ceLa2mnwOphm+fEkzSyAV4a4AXDjdX06zSDiFjiwl0YXx18Y9hEXTvmPqqiag0q3+PIkJ5RTu
 TDI3UpI8CYgDb5p225aGUzLdu3OKep7qmjyWZBYKR8vm9MT3KAz1v7NwtL/IGA4TSPu0KKzuW
 jmzqUBOphp8FjSLnU9mvsMu08P1CQt+MyQdXQUvRL1KdjN2LbxYgp+BPYajo/Lf9Jg9JWJEc8
 JPKEti9xLP/u/+RyVzue2Q0nZwWAR6Q3I1coQ8CVIpVs9zFajfbEDdIEKfRqUp2ZwEhhbUERI
 qwkJA0z6sIz4ItOt/hVAAOTOCfCFHqP/XUFGC9If65H5KhQOdzuO7AgjbxKaru+jx5Wbkdodk
 yZJhWE0AC9FR7rwZOEVVcNb9hDWfC6DiarTBUP6MOLcWOCwSqMPJJ758SY+LZrC4N86uaw/G2
 CHV0yAAH4HTjqrzxtALn5qp63GXKQJ77lqUKmvR0mGXWczqhjisurZvZLlsFJBjIlmPeiwpWg
 O6a+wKo8k0H3mUnWnMRorOz6VGSxX9H0nDKj16Ebovj6bi96oz1roMzcmVu9CW5mcwb0Us9P0
 Y9BppesdYSH4anYTTbrg+s/HxYqCXmFod07MV+U3FDOCIcGVPYY8oGvRf0adbnhsASqWL9JBO
 F9kuMadcZ1X4qLajdVCz86vLJwr1j7vJ+o4BO/TzcX39/WrE1neZVWQm4ftrU31SZg1RnO6vq
 SPIb852VfjKYnEEw6G4GqCtg+0AAboSnntv77mJ1EEMNQVKCvXPC5stAk8r6ZrFyifOk/ACRT
 naWrz96QOUL6Rn6OqOKjwsc2gr1+EI8bTasjMJdmDz4c8AXv8FwZiZ/cwelZj9r/lWQbD7U57
 mrclP4sSrOdVNoo+ZXgafK5RutDsr7IwHEfsSlSr+y8MheZd+LqzMtr2eNWcpQOpvi1e9jqDW
 jkKIMg==

On 11/16/22 18:48, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
> head:   59d0d52c30d4991ac4b329f049cc37118e00f5b0
> commit: 5f7ee6e37a3cadefe45378c17c4285fa41141d92 parisc: Autodetect defa=
ult output device and set console=3D kernel parameter
> date:   10 months ago
> config: parisc-randconfig-m041-20221116
> compiler: hppa-linux-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> smatch warnings:
> arch/parisc/kernel/setup.c:64 setup_cmdline() warn: inconsistent indenti=
ng

Fixed now in for-next.

Thanks.
Helge


> vim +64 arch/parisc/kernel/setup.c
>
>      47
>      48	void __init setup_cmdline(char **cmdline_p)
>      49	{
>      50		extern unsigned int boot_args[];
>      51		char *p;
>      52
>      53		/* Collect stuff passed in from the boot loader */
>      54
>      55		/* boot_args[0] is free-mem start, boot_args[1] is ptr to comma=
nd line */
>      56		if (boot_args[0] < 64) {
>      57			/* called from hpux boot loader */
>      58			boot_command_line[0] =3D '\0';
>      59		} else {
>      60			strscpy(boot_command_line, (char *)__va(boot_args[1]),
>      61				COMMAND_LINE_SIZE);
>      62
>      63		/* autodetect console type (if not done by palo yet) */
>    > 64		p =3D boot_command_line;
>      65		if (!str_has_prefix(p, "console=3D") && !strstr(p, " console=3D=
")) {
>      66			strlcat(p, " console=3D", COMMAND_LINE_SIZE);
>      67			if (PAGE0->mem_cons.cl_class =3D=3D CL_DUPLEX)
>      68				strlcat(p, "ttyS0", COMMAND_LINE_SIZE);
>      69			else
>      70				strlcat(p, "tty0", COMMAND_LINE_SIZE);
>      71		}
>      72
>

