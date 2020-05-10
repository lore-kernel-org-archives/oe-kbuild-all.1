Content-Type: multipart/mixed; boundary="===============8828527163805061691=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v11 54/56] input: atmel_mxt_ts: added sysfs interface to update atmel T38 data
Date: Sun, 10 May 2020 20:03:11 +0800
Message-ID: <202005101947.mMD4gvx7%lkp@intel.com>
In-Reply-To: <20200508055656.96389-55-jiada_wang@mentor.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8828527163805061691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jiada,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on input/next]
[also build test WARNING on xen-tip/linux-next robh/for-next linus/master v=
5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Jiada-Wang/atmel_mxt_ts-mi=
sc/20200509-031552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/input/touchscreen/atmel_mxt_ts.c:4045:8: warning: %d in format s=
tring (no. 2) requires 'int *' but the argument type is 'unsigned int *'. [=
invalidScanfArgType_int]
    ret =3D sscanf(buf, "%zd %d%zd", &offset, &len, &pos);
          ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1993:20: warning: Unsigned expr=
ession 'byte_offset' can't be negative so it is unnecessary to test it. [un=
signedPositive]
      if (byte_offset >=3D 0 && byte_offset < cfg->mem_size) {
                      ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1024:33: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_RESET ? " RESET" : "",
                                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1025:31: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_OFL ? " OFL" : "",
                                 ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1026:34: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_SIGERR ? " SIGERR" : "",
                                    ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1027:31: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_CAL ? " CAL" : "",
                                 ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1028:34: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_CFGERR ? " CFGERR" : "",
                                    ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1029:35: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_COMSERR ? " COMSERR" : "");
                                     ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1346:17: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x01 ? "FREQCHG " : "",
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1347:17: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x02 ? "APXCHG " : "",
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1348:17: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x04 ? "ALGOERR " : "",
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1349:17: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x10 ? "STATCHG " : "",
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1350:17: warning: Clarify calcu=
lation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x20 ? "NLVLCHG " : "");
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:274:20: warning: struct member =
'mxt_dbg::t37_buf' is never used. [unusedStructMember]
    struct t37_debug *t37_buf;
                      ^
   drivers/input/touchscreen/atmel_mxt_ts.c:275:15: warning: struct member =
'mxt_dbg::t37_pages' is never used. [unusedStructMember]
    unsigned int t37_pages;
                 ^
   drivers/input/touchscreen/atmel_mxt_ts.c:276:15: warning: struct member =
'mxt_dbg::t37_nodes' is never used. [unusedStructMember]
    unsigned int t37_nodes;

vim +4045 drivers/input/touchscreen/atmel_mxt_ts.c

  4024	=

  4025	static ssize_t t38_data_store(struct device *dev,
  4026				      struct device_attribute *attr,
  4027				      const char *buf, size_t count)
  4028	{
  4029		struct mxt_data *data =3D dev_get_drvdata(dev);
  4030		struct mxt_object *object;
  4031		ssize_t ret =3D 0, pos, offset;
  4032		unsigned int i, len, index;
  4033		u8 *t38_buf;
  4034	=

  4035		if (!data->object_table)
  4036			return -ENXIO;
  4037	=

  4038		object =3D mxt_get_object(data, MXT_SPT_USERDATA_T38);
  4039	=

  4040		/* Pre-allocate buffer large enough to hold max size of t38 object.=
*/
  4041		t38_buf =3D kmalloc(mxt_obj_size(object), GFP_KERNEL);
  4042		if (!t38_buf)
  4043			return -ENOMEM;
  4044	=

> 4045		ret =3D sscanf(buf, "%zd %d%zd", &offset, &len, &pos);
  4046		if (ret !=3D 2) {
  4047			dev_err(dev, "Bad format: Invalid parameter to update t38\n");
  4048			ret =3D -EINVAL;
  4049			goto end;
  4050		}
  4051	=

  4052		if (len =3D=3D 0) {
  4053			dev_err(dev,
  4054				"Bad format: Data length should not be equal to 0\n");
  4055			ret =3D -EINVAL;
  4056			goto end;
  4057		}
  4058	=

  4059		if (offset < 0 || ((offset + len) > 64)) {
  4060			dev_err(dev, "Invalid offset value to update t38\n");
  4061			ret =3D -EINVAL;
  4062			goto end;
  4063		}
  4064	=

  4065		index =3D pos;
  4066		for (i =3D 0; i < len; i++) {
  4067			ret =3D sscanf(buf + index, "%hhx%zd", t38_buf + i, &pos);
  4068			if (ret !=3D 1) {
  4069				dev_err(dev, "Bad format: Invalid Data\n");
  4070				ret =3D -EINVAL;
  4071				goto end;
  4072			}
  4073			index +=3D pos;
  4074		}
  4075	=

  4076		ret =3D __mxt_write_reg(data->client, object->start_address + offse=
t,
  4077				      len, t38_buf);
  4078		if (ret)
  4079			goto end;
  4080	=

  4081		ret =3D mxt_t6_command(data, MXT_COMMAND_BACKUPNV, MXT_BACKUP_VALUE,
  4082				     true);
  4083		if (ret)
  4084			dev_err(dev, "backup command failed\n");
  4085		else
  4086			ret =3D count;
  4087	end:
  4088		kfree(t38_buf);
  4089		return ret;
  4090	}
  4091	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8828527163805061691==--

