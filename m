Content-Type: multipart/mixed; boundary="===============4871218736624960072=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short' but the argument has type 'int'
Date: Fri, 07 May 2021 18:00:31 +0800
Message-ID: <0102b8fe-3edf-3d4f-2622-d1fefb36274f@intel.com>
In-Reply-To: <20210506115546.GA1745@michael-VirtualBox>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4871218736624960072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/6/2021 7:55 PM, Michael Zaidman wrote:
> On Thu, May 06, 2021 at 06:47:46AM +0800, kernel test robot wrote:
>>
>>     drivers/hid/hid-ft260.c:515:59: warning: variable 'len' is uninitial=
ized when used here [-Wuninitialized]
>>                     hid_err(hdev, "%s: unsupported wr len: %d\n", __func=
__, len);
>>                                                                         =
    ^~~
>>     include/linux/hid.h:1190:30: note: expanded from macro 'hid_err'
>>             dev_err(&(hid)->dev, fmt, ##__VA_ARGS__)
>>                                         ^~~~~~~~~~~
>>     include/linux/dev_printk.h:112:32: note: expanded from macro 'dev_er=
r'
>>             _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>>                                           ^~~~~~~~~~~
>>     drivers/hid/hid-ft260.c:507:9: note: initialize the variable 'len' t=
o silence this warning
>>             int len, ret;
>>                    ^
>>                     =3D 0
> =

> This warning has already been found and fixed by Dan Carpenter in
> the "HID: ft260: fix an error message in ft260_i2c_write_read()" commit
> on March 18, 2021.

Hi Michael,

This report is about the below warning prefixed by '>>', it's still in =

mainline:

 >> drivers/hid/hid-ft260.c:794:44: warning: format specifies type =

'short' but the argument has type 'int' [-Wformat]
            return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
                                              ~~~     ^~~~~~~~~~~~~~~~~~~
                                              %i

Best Regards,
Rong Chen
--===============4871218736624960072==--

