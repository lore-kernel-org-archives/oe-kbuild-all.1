Content-Type: multipart/mixed; boundary="===============8452633868973082561=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/power/supply/mp2629_charger.c:522:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'.
Date: Mon, 12 Oct 2020 13:35:40 +0800
Message-ID: <bbb89cb9-ce1b-6863-dcc5-c27ba9c05819@intel.com>
In-Reply-To: <CAHp75VdX_uxbrkX=XF11WDBcuXjpQYWjjOzVzJ8ffj46oGw_JA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8452633868973082561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/9/20 10:27 PM, Andy Shevchenko wrote:
> On Fri, Oct 9, 2020 at 4:23 PM kernel test robot <lkp@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
>> head:   549738f15da0e5a00275977623be199fbbf7df50
>> commit: 3bc6d790c39dfc4539c36525e6bcb617abbae467 power: supply: Add supp=
ort for mps mp2629 battery charger
>> date:   4 months ago
>> :::::: branch date: 12 hours ago
>> :::::: commit date: 4 months ago
>> compiler: sh4-linux-gcc (GCC) 9.3.0
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
> ...
>
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  514          unsigned int rva=
l;
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  515          int ret;
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  516
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  517          ret =3D regmap_r=
ead(charger->regmap, MP2629_REG_IMPEDANCE_COMP, &rval);
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  518          if (ret)
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  519                  return r=
et;
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  520
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  521          rval =3D (rval >=
> 4) * 10;
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26 @522          return sprintf(b=
uf, "%d mohm\n", rval);
>> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  523  }
> Right, should be %u. Can LKP generate this type of patches?
>

Hi Andy,

Thanks for the advice, is there a auto correct tool to do such thing?
I afraid we can't cover all the circumstances.

Best Regards,
Rong Chen
--===============8452633868973082561==--

