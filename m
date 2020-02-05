Content-Type: multipart/mixed; boundary="===============4394602264565355571=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1] platform/chrome: wilco_ec: Platform data shan't include kernel.h
Date: Wed, 05 Feb 2020 10:43:14 +0800
Message-ID: <202002051010.tSvPdMMe%lkp@intel.com>
In-Reply-To: <20200204162729.29175-1-andriy.shevchenko@linux.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4394602264565355571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.5 next-20200204]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/platform-c=
hrome-wilco_ec-Platform-data-shan-t-include-kernel-h/20200205-035444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
d4e9056daedca3891414fe3c91de3449a5dad0f2
config: x86_64-randconfig-s2-20200205 (attached as .config)
compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/platform/chrome/wilco_ec/sysfs.c:67:5: warning: 'struct device_a=
ttribute' declared inside parameter list
        const char *buf, size_t count)
        ^
>> drivers/platform/chrome/wilco_ec/sysfs.c:67:5: warning: its scope is onl=
y this definition or declaration, which is probably not what you want
   drivers/platform/chrome/wilco_ec/sysfs.c: In function 'boot_on_ac_store':
   drivers/platform/chrome/wilco_ec/sysfs.c:69:31: error: implicit declarat=
ion of function 'dev_get_drvdata' [-Werror=3Dimplicit-function-declaration]
     struct wilco_ec_device *ec =3D dev_get_drvdata(dev);
                                  ^
   drivers/platform/chrome/wilco_ec/sysfs.c:69:31: warning: initialization =
makes pointer from integer without a cast [-Wint-conversion]
   drivers/platform/chrome/wilco_ec/sysfs.c: At top level:
   drivers/platform/chrome/wilco_ec/sysfs.c:97:8: error: type defaults to '=
int' in declaration of 'DEVICE_ATTR_WO' [-Werror=3Dimplicit-int]
    static DEVICE_ATTR_WO(boot_on_ac);
           ^
   drivers/platform/chrome/wilco_ec/sysfs.c:97:1: warning: parameter names =
(without types) in function declaration
    static DEVICE_ATTR_WO(boot_on_ac);
    ^
   drivers/platform/chrome/wilco_ec/sysfs.c: In function 'get_info':
   drivers/platform/chrome/wilco_ec/sysfs.c:101:31: warning: initialization=
 makes pointer from integer without a cast [-Wint-conversion]
     struct wilco_ec_device *ec =3D dev_get_drvdata(dev);
                                  ^
   drivers/platform/chrome/wilco_ec/sysfs.c: At top level:
   drivers/platform/chrome/wilco_ec/sysfs.c:123:6: warning: 'struct device_=
attribute' declared inside parameter list
         char *buf)
         ^
   drivers/platform/chrome/wilco_ec/sysfs.c:128:8: error: type defaults to =
'int' in declaration of 'DEVICE_ATTR_RO' [-Werror=3Dimplicit-int]
    static DEVICE_ATTR_RO(version);
           ^
   drivers/platform/chrome/wilco_ec/sysfs.c:128:1: warning: parameter names=
 (without types) in function declaration
    static DEVICE_ATTR_RO(version);
    ^
   drivers/platform/chrome/wilco_ec/sysfs.c:131:15: warning: 'struct device=
_attribute' declared inside parameter list
           struct device_attribute *attr, char *buf)
                  ^
   drivers/platform/chrome/wilco_ec/sysfs.c:136:8: error: type defaults to =
'int' in declaration of 'DEVICE_ATTR_RO' [-Werror=3Dimplicit-int]
    static DEVICE_ATTR_RO(build_revision);
           ^
   drivers/platform/chrome/wilco_ec/sysfs.c:136:1: warning: parameter names=
 (without types) in function declaration
    static DEVICE_ATTR_RO(build_revision);
    ^
   drivers/platform/chrome/wilco_ec/sysfs.c:139:18: warning: 'struct device=
_attribute' declared inside parameter list
              struct device_attribute *attr, char *buf)
                     ^
   drivers/platform/chrome/wilco_ec/sysfs.c:144:8: error: type defaults to =
'int' in declaration of 'DEVICE_ATTR_RO' [-Werror=3Dimplicit-int]
    static DEVICE_ATTR_RO(build_date);
           ^
   drivers/platform/chrome/wilco_ec/sysfs.c:144:1: warning: parameter names=
 (without types) in function declaration
    static DEVICE_ATTR_RO(build_date);
    ^
   drivers/platform/chrome/wilco_ec/sysfs.c:147:13: warning: 'struct device=
_attribute' declared inside parameter list
         struct device_attribute *attr, char *buf)
                ^
   drivers/platform/chrome/wilco_ec/sysfs.c:152:8: error: type defaults to =
'int' in declaration of 'DEVICE_ATTR_RO' [-Werror=3Dimplicit-int]
    static DEVICE_ATTR_RO(model_number);
           ^
   drivers/platform/chrome/wilco_ec/sysfs.c:152:1: warning: parameter names=
 (without types) in function declaration
    static DEVICE_ATTR_RO(model_number);
    ^
   drivers/platform/chrome/wilco_ec/sysfs.c:177:16: warning: 'struct device=
_attribute' declared inside parameter list
            struct device_attribute *attr, char *buf)
                   ^
   drivers/platform/chrome/wilco_ec/sysfs.c: In function 'usb_charge_show':
   drivers/platform/chrome/wilco_ec/sysfs.c:179:31: warning: initialization=
 makes pointer from integer without a cast [-Wint-conversion]
     struct wilco_ec_device *ec =3D dev_get_drvdata(dev);
                                  ^
   drivers/platform/chrome/wilco_ec/sysfs.c: At top level:
   drivers/platform/chrome/wilco_ec/sysfs.c:197:10: warning: 'struct device=
_attribute' declared inside parameter list
             const char *buf, size_t count)
             ^
   drivers/platform/chrome/wilco_ec/sysfs.c: In function 'usb_charge_store':
   drivers/platform/chrome/wilco_ec/sysfs.c:199:31: warning: initialization=
 makes pointer from integer without a cast [-Wint-conversion]
     struct wilco_ec_device *ec =3D dev_get_drvdata(dev);
                                  ^
   drivers/platform/chrome/wilco_ec/sysfs.c: At top level:
   drivers/platform/chrome/wilco_ec/sysfs.c:223:8: error: type defaults to =
'int' in declaration of 'DEVICE_ATTR_RW' [-Werror=3Dimplicit-int]
    static DEVICE_ATTR_RW(usb_charge);
           ^
   drivers/platform/chrome/wilco_ec/sysfs.c:223:1: warning: parameter names=
 (without types) in function declaration
    static DEVICE_ATTR_RW(usb_charge);
    ^
   drivers/platform/chrome/wilco_ec/sysfs.c:226:3: error: 'dev_attr_boot_on=
_ac' undeclared here (not in a function)
     &dev_attr_boot_on_ac.attr,
      ^
>> drivers/platform/chrome/wilco_ec/sysfs.c:227:3: error: 'dev_attr_build_d=
ate' undeclared here (not in a function)
     &dev_attr_build_date.attr,
      ^
>> drivers/platform/chrome/wilco_ec/sysfs.c:228:3: error: 'dev_attr_build_r=
evision' undeclared here (not in a function)
     &dev_attr_build_revision.attr,
      ^
>> drivers/platform/chrome/wilco_ec/sysfs.c:229:3: error: 'dev_attr_model_n=
umber' undeclared here (not in a function)
     &dev_attr_model_number.attr,
      ^
>> drivers/platform/chrome/wilco_ec/sysfs.c:230:3: error: 'dev_attr_usb_cha=
rge' undeclared here (not in a function)
     &dev_attr_usb_charge.attr,
      ^
>> drivers/platform/chrome/wilco_ec/sysfs.c:231:3: error: 'dev_attr_version=
' undeclared here (not in a function)
     &dev_attr_version.attr,
      ^
   drivers/platform/chrome/wilco_ec/sysfs.c: In function 'wilco_ec_add_sysf=
s':
   drivers/platform/chrome/wilco_ec/sysfs.c:241:36: error: dereferencing po=
inter to incomplete type 'struct device'
     return sysfs_create_group(&ec->dev->kobj, &wilco_dev_attr_group);
                                       ^
   drivers/platform/chrome/wilco_ec/sysfs.c:241:36: error: request for memb=
er 'kobj' in something not a structure or union
   drivers/platform/chrome/wilco_ec/sysfs.c:241:28: error: passing argument=
 1 of 'sysfs_create_group' from incompatible pointer type [-Werror=3Dincomp=
atible-pointer-types]
     return sysfs_create_group(&ec->dev->kobj, &wilco_dev_attr_group);
                               ^
   In file included from drivers/platform/chrome/wilco_ec/sysfs.c:12:0:
   include/linux/sysfs.h:276:18: note: expected 'struct kobject *' but argu=
ment is of type 'struct attribute * (*)[1]'
    int __must_check sysfs_create_group(struct kobject *kobj,
                     ^
   drivers/platform/chrome/wilco_ec/sysfs.c: In function 'wilco_ec_remove_s=
ysfs':
   drivers/platform/chrome/wilco_ec/sysfs.c:246:29: error: request for memb=
er 'kobj' in something not a structure or union
     sysfs_remove_group(&ec->dev->kobj, &wilco_dev_attr_group);
                                ^
   drivers/platform/chrome/wilco_ec/sysfs.c:246:21: error: passing argument=
 1 of 'sysfs_remove_group' from incompatible pointer type [-Werror=3Dincomp=
atible-pointer-types]
     sysfs_remove_group(&ec->dev->kobj, &wilco_dev_attr_group);
                        ^
   In file included from drivers/platform/chrome/wilco_ec/sysfs.c:12:0:
   include/linux/sysfs.h:284:6: note: expected 'struct kobject *' but argum=
ent is of type 'struct attribute * (*)[1]'
    void sysfs_remove_group(struct kobject *kobj,
         ^
   drivers/platform/chrome/wilco_ec/sysfs.c: At top level:
   drivers/platform/chrome/wilco_ec/sysfs.c:65:16: warning: 'boot_on_ac_sto=
re' defined but not used [-Wunused-function]
    static ssize_t boot_on_ac_store(struct device *dev,
                   ^
   drivers/platform/chrome/wilco_ec/sysfs.c:97:8: warning: 'DEVICE_ATTR_WO'=
 declared 'static' but never defined [-Wunused-function]
    static DEVICE_ATTR_WO(boot_on_ac);
           ^
   drivers/platform/chrome/wilco_ec/sysfs.c:122:16: warning: 'version_show'=
 defined but not used [-Wunused-function]
    static ssize_t version_show(struct device *dev, struct device_attribute=
 *attr,
                   ^
   drivers/platform/chrome/wilco_ec/sysfs.c:152:8: warning: 'DEVICE_ATTR_RO=
' declared 'static' but never defined [-Wunused-function]
    static DEVICE_ATTR_RO(model_number);
           ^
   drivers/platform/chrome/wilco_ec/sysfs.c:130:16: warning: 'build_revisio=
n_show' defined but not used [-Wunused-function]
    static ssize_t build_revision_show(struct device *dev,
                   ^
   drivers/platform/chrome/wilco_ec/sysfs.c:138:16: warning: 'build_date_sh=
ow' defined but not used [-Wunused-function]
    static ssize_t build_date_show(struct device *dev,
                   ^
   drivers/platform/chrome/wilco_ec/sysfs.c:146:16: warning: 'model_number_=
show' defined but not used [-Wunused-function]
    static ssize_t model_number_show(struct device *dev,
                   ^
   drivers/platform/chrome/wilco_ec/sysfs.c:176:16: warning: 'usb_charge_sh=
ow' defined but not used [-Wunused-function]
    static ssize_t usb_charge_show(struct device *dev,
                   ^
   drivers/platform/chrome/wilco_ec/sysfs.c:195:16: warning: 'usb_charge_st=
ore' defined but not used [-Wunused-function]
    static ssize_t usb_charge_store(struct device *dev,
                   ^
   drivers/platform/chrome/wilco_ec/sysfs.c:223:8: warning: 'DEVICE_ATTR_RW=
' declared 'static' but never defined [-Wunused-function]
    static DEVICE_ATTR_RW(usb_charge);
           ^
   cc1: some warnings being treated as errors

vim +/dev_attr_build_date +227 drivers/platform/chrome/wilco_ec/sysfs.c

79e3f1d3db3d99 Raul E Rangel   2019-06-03   64  =

4c1ca625c622b7 Nick Crews      2019-04-16   65  static ssize_t boot_on_ac_s=
tore(struct device *dev,
4c1ca625c622b7 Nick Crews      2019-04-16   66  				struct device_attribute=
 *attr,
4c1ca625c622b7 Nick Crews      2019-04-16  @67  				const char *buf, size_t=
 count)
4c1ca625c622b7 Nick Crews      2019-04-16   68  {
4c1ca625c622b7 Nick Crews      2019-04-16   69  	struct wilco_ec_device *ec=
 =3D dev_get_drvdata(dev);
4c1ca625c622b7 Nick Crews      2019-04-16   70  	struct boot_on_ac_request =
rq;
4c1ca625c622b7 Nick Crews      2019-04-16   71  	struct wilco_ec_message ms=
g;
4c1ca625c622b7 Nick Crews      2019-04-16   72  	int ret;
4c1ca625c622b7 Nick Crews      2019-04-16   73  	u8 val;
4c1ca625c622b7 Nick Crews      2019-04-16   74  =

4c1ca625c622b7 Nick Crews      2019-04-16   75  	ret =3D kstrtou8(buf, 10, =
&val);
4c1ca625c622b7 Nick Crews      2019-04-16   76  	if (ret < 0)
4c1ca625c622b7 Nick Crews      2019-04-16   77  		return ret;
4c1ca625c622b7 Nick Crews      2019-04-16   78  	if (val > 1)
4c1ca625c622b7 Nick Crews      2019-04-16   79  		return -EINVAL;
4c1ca625c622b7 Nick Crews      2019-04-16   80  =

4c1ca625c622b7 Nick Crews      2019-04-16   81  	memset(&rq, 0, sizeof(rq));
4c1ca625c622b7 Nick Crews      2019-04-16   82  	rq.cmd =3D CMD_KB_CMOS;
4c1ca625c622b7 Nick Crews      2019-04-16   83  	rq.sub_cmd =3D SUB_CMD_KB_=
CMOS_AUTO_ON;
4c1ca625c622b7 Nick Crews      2019-04-16   84  	rq.val =3D val;
4c1ca625c622b7 Nick Crews      2019-04-16   85  =

4c1ca625c622b7 Nick Crews      2019-04-16   86  	memset(&msg, 0, sizeof(msg=
));
4c1ca625c622b7 Nick Crews      2019-04-16   87  	msg.type =3D WILCO_EC_MSG_=
LEGACY;
4c1ca625c622b7 Nick Crews      2019-04-16   88  	msg.request_data =3D &rq;
4c1ca625c622b7 Nick Crews      2019-04-16   89  	msg.request_size =3D sizeo=
f(rq);
4c1ca625c622b7 Nick Crews      2019-04-16   90  	ret =3D wilco_ec_mailbox(e=
c, &msg);
4c1ca625c622b7 Nick Crews      2019-04-16   91  	if (ret < 0)
4c1ca625c622b7 Nick Crews      2019-04-16   92  		return ret;
4c1ca625c622b7 Nick Crews      2019-04-16   93  =

4c1ca625c622b7 Nick Crews      2019-04-16   94  	return count;
4c1ca625c622b7 Nick Crews      2019-04-16   95  }
4c1ca625c622b7 Nick Crews      2019-04-16   96  =

4c1ca625c622b7 Nick Crews      2019-04-16   97  static DEVICE_ATTR_WO(boot_=
on_ac);
4c1ca625c622b7 Nick Crews      2019-04-16   98  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03   99  static ssize_t get_info(str=
uct device *dev, char *buf, enum get_ec_info_op op)
79e3f1d3db3d99 Raul E Rangel   2019-06-03  100  {
79e3f1d3db3d99 Raul E Rangel   2019-06-03  101  	struct wilco_ec_device *ec=
 =3D dev_get_drvdata(dev);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  102  	struct get_ec_info_req req=
 =3D { .cmd =3D CMD_EC_INFO, .op =3D op };
79e3f1d3db3d99 Raul E Rangel   2019-06-03  103  	struct get_ec_info_resp re=
sp;
79e3f1d3db3d99 Raul E Rangel   2019-06-03  104  	int ret;
79e3f1d3db3d99 Raul E Rangel   2019-06-03  105  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  106  	struct wilco_ec_message ms=
g =3D {
79e3f1d3db3d99 Raul E Rangel   2019-06-03  107  		.type =3D WILCO_EC_MSG_LE=
GACY,
79e3f1d3db3d99 Raul E Rangel   2019-06-03  108  		.request_data =3D &req,
79e3f1d3db3d99 Raul E Rangel   2019-06-03  109  		.request_size =3D sizeof(=
req),
79e3f1d3db3d99 Raul E Rangel   2019-06-03  110  		.response_data =3D &resp,
79e3f1d3db3d99 Raul E Rangel   2019-06-03  111  		.response_size =3D sizeof=
(resp),
79e3f1d3db3d99 Raul E Rangel   2019-06-03  112  	};
79e3f1d3db3d99 Raul E Rangel   2019-06-03  113  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  114  	ret =3D wilco_ec_mailbox(e=
c, &msg);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  115  	if (ret < 0)
79e3f1d3db3d99 Raul E Rangel   2019-06-03  116  		return ret;
79e3f1d3db3d99 Raul E Rangel   2019-06-03  117  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  118  	return scnprintf(buf, PAGE=
_SIZE, "%.*s\n", (int)sizeof(resp.value),
79e3f1d3db3d99 Raul E Rangel   2019-06-03  119  			 (char *)&resp.value);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  120  }
79e3f1d3db3d99 Raul E Rangel   2019-06-03  121  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  122  static ssize_t version_show=
(struct device *dev, struct device_attribute *attr,
79e3f1d3db3d99 Raul E Rangel   2019-06-03  123  			  char *buf)
79e3f1d3db3d99 Raul E Rangel   2019-06-03  124  {
79e3f1d3db3d99 Raul E Rangel   2019-06-03  125  	return get_info(dev, buf, =
CMD_GET_EC_LABEL);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  126  }
79e3f1d3db3d99 Raul E Rangel   2019-06-03  127  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  128  static DEVICE_ATTR_RO(versi=
on);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  129  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  130  static ssize_t build_revisi=
on_show(struct device *dev,
79e3f1d3db3d99 Raul E Rangel   2019-06-03  131  				   struct device_attrib=
ute *attr, char *buf)
79e3f1d3db3d99 Raul E Rangel   2019-06-03  132  {
79e3f1d3db3d99 Raul E Rangel   2019-06-03  133  	return get_info(dev, buf, =
CMD_GET_EC_REV);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  134  }
79e3f1d3db3d99 Raul E Rangel   2019-06-03  135  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  136  static DEVICE_ATTR_RO(build=
_revision);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  137  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  138  static ssize_t build_date_s=
how(struct device *dev,
79e3f1d3db3d99 Raul E Rangel   2019-06-03  139  			       struct device_att=
ribute *attr, char *buf)
79e3f1d3db3d99 Raul E Rangel   2019-06-03  140  {
79e3f1d3db3d99 Raul E Rangel   2019-06-03  141  	return get_info(dev, buf, =
CMD_GET_EC_BUILD_DATE);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  142  }
79e3f1d3db3d99 Raul E Rangel   2019-06-03  143  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  144  static DEVICE_ATTR_RO(build=
_date);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  145  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  146  static ssize_t model_number=
_show(struct device *dev,
79e3f1d3db3d99 Raul E Rangel   2019-06-03  147  				 struct device_attribut=
e *attr, char *buf)
79e3f1d3db3d99 Raul E Rangel   2019-06-03  148  {
79e3f1d3db3d99 Raul E Rangel   2019-06-03  149  	return get_info(dev, buf, =
CMD_GET_EC_MODEL);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  150  }
79e3f1d3db3d99 Raul E Rangel   2019-06-03  151  =

79e3f1d3db3d99 Raul E Rangel   2019-06-03  152  static DEVICE_ATTR_RO(model=
_number);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  153  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  154  static int send_usb_charge(=
struct wilco_ec_device *ec,
fdf0fe2df3e321 Daniel Campello 2019-10-08  155  				struct usb_charge_reque=
st *rq,
fdf0fe2df3e321 Daniel Campello 2019-10-08  156  				struct usb_charge_respo=
nse *rs)
fdf0fe2df3e321 Daniel Campello 2019-10-08  157  {
fdf0fe2df3e321 Daniel Campello 2019-10-08  158  	struct wilco_ec_message ms=
g;
fdf0fe2df3e321 Daniel Campello 2019-10-08  159  	int ret;
fdf0fe2df3e321 Daniel Campello 2019-10-08  160  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  161  	memset(&msg, 0, sizeof(msg=
));
fdf0fe2df3e321 Daniel Campello 2019-10-08  162  	msg.type =3D WILCO_EC_MSG_=
LEGACY;
fdf0fe2df3e321 Daniel Campello 2019-10-08  163  	msg.request_data =3D rq;
fdf0fe2df3e321 Daniel Campello 2019-10-08  164  	msg.request_size =3D sizeo=
f(*rq);
fdf0fe2df3e321 Daniel Campello 2019-10-08  165  	msg.response_data =3D rs;
fdf0fe2df3e321 Daniel Campello 2019-10-08  166  	msg.response_size =3D size=
of(*rs);
fdf0fe2df3e321 Daniel Campello 2019-10-08  167  	ret =3D wilco_ec_mailbox(e=
c, &msg);
fdf0fe2df3e321 Daniel Campello 2019-10-08  168  	if (ret < 0)
fdf0fe2df3e321 Daniel Campello 2019-10-08  169  		return ret;
fdf0fe2df3e321 Daniel Campello 2019-10-08  170  	if (rs->status)
fdf0fe2df3e321 Daniel Campello 2019-10-08  171  		return -EIO;
fdf0fe2df3e321 Daniel Campello 2019-10-08  172  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  173  	return 0;
fdf0fe2df3e321 Daniel Campello 2019-10-08  174  }
fdf0fe2df3e321 Daniel Campello 2019-10-08  175  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  176  static ssize_t usb_charge_s=
how(struct device *dev,
fdf0fe2df3e321 Daniel Campello 2019-10-08  177  				    struct device_attri=
bute *attr, char *buf)
fdf0fe2df3e321 Daniel Campello 2019-10-08  178  {
fdf0fe2df3e321 Daniel Campello 2019-10-08  179  	struct wilco_ec_device *ec=
 =3D dev_get_drvdata(dev);
fdf0fe2df3e321 Daniel Campello 2019-10-08  180  	struct usb_charge_request =
rq;
fdf0fe2df3e321 Daniel Campello 2019-10-08  181  	struct usb_charge_response=
 rs;
fdf0fe2df3e321 Daniel Campello 2019-10-08  182  	int ret;
fdf0fe2df3e321 Daniel Campello 2019-10-08  183  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  184  	memset(&rq, 0, sizeof(rq));
fdf0fe2df3e321 Daniel Campello 2019-10-08  185  	rq.cmd =3D CMD_USB_CHARGE;
fdf0fe2df3e321 Daniel Campello 2019-10-08  186  	rq.op =3D USB_CHARGE_GET;
fdf0fe2df3e321 Daniel Campello 2019-10-08  187  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  188  	ret =3D send_usb_charge(ec=
, &rq, &rs);
fdf0fe2df3e321 Daniel Campello 2019-10-08  189  	if (ret < 0)
fdf0fe2df3e321 Daniel Campello 2019-10-08  190  		return ret;
fdf0fe2df3e321 Daniel Campello 2019-10-08  191  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  192  	return sprintf(buf, "%d\n"=
, rs.val);
fdf0fe2df3e321 Daniel Campello 2019-10-08  193  }
fdf0fe2df3e321 Daniel Campello 2019-10-08  194  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  195  static ssize_t usb_charge_s=
tore(struct device *dev,
fdf0fe2df3e321 Daniel Campello 2019-10-08  196  				     struct device_attr=
ibute *attr,
fdf0fe2df3e321 Daniel Campello 2019-10-08  197  				     const char *buf, s=
ize_t count)
fdf0fe2df3e321 Daniel Campello 2019-10-08  198  {
fdf0fe2df3e321 Daniel Campello 2019-10-08  199  	struct wilco_ec_device *ec=
 =3D dev_get_drvdata(dev);
fdf0fe2df3e321 Daniel Campello 2019-10-08  200  	struct usb_charge_request =
rq;
fdf0fe2df3e321 Daniel Campello 2019-10-08  201  	struct usb_charge_response=
 rs;
fdf0fe2df3e321 Daniel Campello 2019-10-08  202  	int ret;
fdf0fe2df3e321 Daniel Campello 2019-10-08  203  	u8 val;
fdf0fe2df3e321 Daniel Campello 2019-10-08  204  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  205  	ret =3D kstrtou8(buf, 10, =
&val);
fdf0fe2df3e321 Daniel Campello 2019-10-08  206  	if (ret < 0)
fdf0fe2df3e321 Daniel Campello 2019-10-08  207  		return ret;
fdf0fe2df3e321 Daniel Campello 2019-10-08  208  	if (val > 1)
fdf0fe2df3e321 Daniel Campello 2019-10-08  209  		return -EINVAL;
fdf0fe2df3e321 Daniel Campello 2019-10-08  210  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  211  	memset(&rq, 0, sizeof(rq));
fdf0fe2df3e321 Daniel Campello 2019-10-08  212  	rq.cmd =3D CMD_USB_CHARGE;
fdf0fe2df3e321 Daniel Campello 2019-10-08  213  	rq.op =3D USB_CHARGE_SET;
fdf0fe2df3e321 Daniel Campello 2019-10-08  214  	rq.val =3D val;
fdf0fe2df3e321 Daniel Campello 2019-10-08  215  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  216  	ret =3D send_usb_charge(ec=
, &rq, &rs);
fdf0fe2df3e321 Daniel Campello 2019-10-08  217  	if (ret < 0)
fdf0fe2df3e321 Daniel Campello 2019-10-08  218  		return ret;
fdf0fe2df3e321 Daniel Campello 2019-10-08  219  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  220  	return count;
fdf0fe2df3e321 Daniel Campello 2019-10-08  221  }
fdf0fe2df3e321 Daniel Campello 2019-10-08  222  =

fdf0fe2df3e321 Daniel Campello 2019-10-08  223  static DEVICE_ATTR_RW(usb_c=
harge);
79e3f1d3db3d99 Raul E Rangel   2019-06-03  224  =

4c1ca625c622b7 Nick Crews      2019-04-16  225  static struct attribute *wi=
lco_dev_attrs[] =3D {
4c1ca625c622b7 Nick Crews      2019-04-16  226  	&dev_attr_boot_on_ac.attr,
79e3f1d3db3d99 Raul E Rangel   2019-06-03 @227  	&dev_attr_build_date.attr,
79e3f1d3db3d99 Raul E Rangel   2019-06-03 @228  	&dev_attr_build_revision.a=
ttr,
79e3f1d3db3d99 Raul E Rangel   2019-06-03 @229  	&dev_attr_model_number.att=
r,
fdf0fe2df3e321 Daniel Campello 2019-10-08 @230  	&dev_attr_usb_charge.attr,
79e3f1d3db3d99 Raul E Rangel   2019-06-03 @231  	&dev_attr_version.attr,
4c1ca625c622b7 Nick Crews      2019-04-16  232  	NULL,
4c1ca625c622b7 Nick Crews      2019-04-16  233  };
4c1ca625c622b7 Nick Crews      2019-04-16  234  =


:::::: The code@line 227 was first introduced by commit
:::::: 79e3f1d3db3d99ac7ae4f29b00da545df231a5a7 platform/chrome: wilco_ec: =
Add version sysfs entries

:::::: TO: Raul E Rangel <rrangel@chromium.org>
:::::: CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============4394602264565355571==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4394602264565355571==--

